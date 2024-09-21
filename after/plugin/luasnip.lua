-- require('luasnip.loaders.from_vscode').lazy_load({ paths = { "./snippets" } })
-- require("luasnip.loaders.from_vscode").lazy_load()
-- require('luasnip.loaders.from_vscode').lazy_load({ paths = { "./after/plugin/snippets" } })

local ls = require "luasnip"
local snip = ls.snippet
local text = ls.text_node

ls.add_snippets(nil, {
    cpp = {
        snip({
            trig = "workspace",
            name = "Workspace",
            dscr = "Default workspace for cpp",
        }, {
            text {
                "// ",
                "// ",
                "// By - Shivoy Arora ",
                "// ",
                "#include <iostream>",
                "#include <vector>",
                "",
                "using namespace std;",
                "",
                "",
                "////////////////////////////////////////////////////////////////////////////////",
                "// Main Function",
                "////////////////////////////////////////////////////////////////////////////////",
                "int main(int argc, char** argv){",
                "\t",
                "\t",
                "\treturn 0;",
                "}"

            },
        }),
    },

    tex = {
        snip({
            trig = "workspace",
            name = "Workspace",
            dscr = "Default workspace for tex",
        }, {
            text {
                "\\documentclass[11pt]{article}",
                "",
                "\\usepackage[margin=1in]{geometry}",
                "\\usepackage{amsmath, amsthm, amssymb}",
                "\\usepackage{graphicx}",
                "\\usepackage{epsfig}",
                "\\usepackage{times}",
                "\\usepackage{enumitem}",
                "\\usepackage[parfill]{parskip}",
                "\\usepackage{color}",
                "\\usepackage{hyperref}",
                "\\usepackage{algorithm}",
                "\\usepackage{algorithmic}",
                "",
                "\\title{}",
                "\\author{Shivoy Arora}",
                "\\date{}",
                "",
                "\\begin{document}",
                "\\maketitle",
                "",
                "\\end{document}",
            },
        }),
    },
})
