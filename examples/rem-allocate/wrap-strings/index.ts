import { Parser } from "../../../src/parser"
import { FunctionDeclaration, Statement, NodeKind, SourceKind, NamedTypeNode, StringLiteralExpression } from "../../../src/ast";
import { parseFile } from "../../../src"

export var afterParse = function (parser: Parser): void {
    // find sources not from ~lib should be user files
    // @ts-ignore
    var sources = parser.program.sources.filter(s => s.sourceKind == SourceKind.USER_ENTRY && !(s.internalPath.includes("~lib")))
    sources.forEach(src => {
        let statements: Statement[] = []
        function push(code: string) {
            statements.push(parseFile(
                code,
                src.range.source.normalizedPath,
                true,
                null
            ).program.sources[0].statements[0])
        }

        let contexts: string[] = []
        src.statements.forEach((s: FunctionDeclaration, i) => {
            if (s.kind !== NodeKind.FUNCTIONDECLARATION || s.body || !s.decorators) {
                return
            }
            //@ts-ignore
            let ctx = (s.decorators[0].arguments[0] as StringLiteralExpression).value || "env"
            if (ctx == "env") {
                return
            }
            //find the current context by name or insert and grab the index
            let id = contexts.findIndex(s => s == ctx)
            if (id < 0) {
                id = contexts.push(ctx) - 1
            }
            //match arg statement
            //params will match the current remote function
            let params: string[] = []
            //params wrap will have the wrapped and non wrapped params for our remote function call
            let paramWrap: string[] = []
            s.signature.parameters.forEach(p => {
                let type = (p.type as NamedTypeNode).name.identifier.text
                //add to params
                params.push(p.name.text + ":" + type)
                if (type == "string") {
                    //param is string, wrap in call to remote function
                    paramWrap.push(`__rem_call(${id},changetype<usize>(${p.name.text}))`);
                    //rename the type in the remote function declaration to i32 to prevent gc
                    (p.type as NamedTypeNode).name.identifier.text="i32"
                } else {
                    //not a string, just add it to the list as is
                    paramWrap.push(p.name.text)
                }
                
            })
            //define the call to the remote function
            let call=`_${s.name.text}(${paramWrap.join(",")})`
            let retType = (s.signature.returnType as NamedTypeNode).name.identifier.text
            //can't return void for some reason, so remove 'return' if not needed
            let ret= retType=="void"?"":"return "
            //if returning a string, wrap the call so we can get the value back into this context
            ret += retType == "string" ? `__rem_return(${id},${call})` 
            : `${call}`
            if (retType=="string"){
                //change remote function declaration return type to i32 to avoid gc
                (s.signature.returnType as NamedTypeNode).name.identifier.text="i32"
            }
            let f=
                `
                function ${s.name.text}(${params.join(",")}): ${retType} {
                    
                    ${ret}
                }
                `
            push(f)
            console.log("added function: "+f)
            //rename remote function declaration so our function gets called
            s.name.text = "_" + s.name.text;
        }) // done with statements


        if (statements.length > 0) {
            // if statements are to be added, add the __ctx array for lookup and the __rem declaration
            push(`export const __ctx:Array<string>=['${contexts.join("','")}']`)
            push(
                `
                @external("env","__rem_call")
                export declare function __rem_call(p:i32,v:i32):i32
                `
            )
            push(
                `
                @external("env","__rem_return")
                export declare function __rem_return(p:i32,v:i32):string
                `
            )
            // and finally add the modified statements
            statements.forEach(s => {
                src.statements.push(s)
            })
        }

    })


}
//just for troubleshooting avoiding the portable lib
function log(...args: any[]): void {
    // @ts-ignore
    console.log(...args)
}
