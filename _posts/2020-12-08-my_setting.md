---
layout: post-for-notes
title:  "SOME SETTING FOR BACKUP"
date:   2020-12-08 10:14:56 +0800
excerpt: ""
notes: true
---

# 编辑器

## VS Code：


```json
{  
    //不覆盖原有的标签
    "workbench.editor.enablePreview": false,
    // python启动文件路径
    "python.pythonPath": "D:\\Users\\Lynie\\Anaconda3\\python.exe",
    //"conda.condaPath": "D:\\Users\\Lynie\\Anaconda3\\Scripts\\conda.exe",

    // matlab配置
    // matlab启动文件路径
    "matlab.matlabpath": "D:\\Program Files\\Polyspace\\R2020b\\bin\\matlab.exe",
    // lint工具路径 （该工具用于语法检查）
    "matlab.mlintpath": "D:\\Program Files\\Polyspace\\R2020b\\bin\\win64\\mlint.exe",
    // 提示编码
    "matlab.linterEncoding": "gb2312",
    // .m文件编码
    "[matlab]": {
        "files.encoding": "gb2312",
        "files.autoGuessEncoding": false,
    },
    // .m文件关联
    "files.associations": {
        "*.m": "matlab"
    },
    "cSpell.enableFiletypes": [
        "matlab"
    ],


    
    "latex-workshop.latex.tools": [
      {
        "name": "latexmk",
        "command": "latexmk",
        "args": [
          "-synctex=1",
          "-interaction=nonstopmode",
          "-file-line-error",
          "-pdf",
          "%DOC%"
        ]
      },
      {
        "name": "xelatex",
        "command": "xelatex",
        "args": [
          "-synctex=1",
          "-interaction=nonstopmode",
          "-file-line-error",
          "%DOC%"
        ]
      },
      {
        "name": "pdflatex",
        "command": "pdflatex",
        "args": [
          "-synctex=1",
          "-interaction=nonstopmode",
          "-file-line-error",
          "%DOC%"
        ]
      },
      {
        "name": "bibtex",
        "command": "bibtex",
        "args": [
          "%DOCFILE%"
        ]
      }
    ],
    "latex-workshop.latex.recipes": [
      {
        "name": "xelatex",
        "tools": [
          "xelatex"
        ]
      },
      {
        "name": "pdflatex",
        "tools": [
          "pdflatex"
        ]
      },
      {
        "name": "latexmk",
        "tools": [
          "latexmk"
        ]
      },
      {
        "name": "pdflatex -> bibtex -> pdflatex*2",
        "tools": [
          "pdflatex",
          "bibtex",
          "pdflatex",
          "pdflatex"
        ]
      }
    ],

  // 设置外部PDF预览器
  "latex-workshop.view.pdf.viewer":"external",
  "latex-workshop.view.pdf.ref.viewer":"external",
  "latex-workshop.view.pdf.external.viewer.command": "D:/Users/Lynie/AppData/Local/SumatraPDF/SumatraPDF.exe",//修改为你的具体SumatraPDF.exe的路径
  "latex-workshop.view.pdf.external.viewer.args": [
          "-inverse-search",
          "\"D:/Users/Lynie/AppData/Local/Programs/Microsoft VS Code/Code.exe\" -g \"%f:%l\"", //修改为你的具体vscode.exe的路径
          "%PDF%"
      ],
  // 设置正向跳转
  "latex-workshop.view.pdf.external.synctex.command":"D:/Users/Lynie/AppData/Local/SumatraPDF/SumatraPDF.exe",//修改为你的具体SumatraPDF.exe的路径
  "latex-workshop.view.pdf.external.synctex.args": [
          "-forward-search",
          "%TEX%",
          "%LINE%",
          "%PDF%"
      ],
      "explorer.confirmDelete": false,
      "editor.autoIndent": "advanced",
      "editor.formatOnPaste": true,
      "http.proxyAuthorization": null,
      "editor.wordWrap": "on",
      "terminal.integrated.commandsToSkipShell": [
        "language-julia.interrupt"
      ]
      "editor.fontSize": 16,
      "julia.enableTelemetry": true,
      "julia.executablePath": "D:\\Program Files\\Julia 1.5.3\\bin\\julia.exe"
      "ECCODES_DEFINITION_PATH": "D:\\Users\\Lynie\\anaconda3\\Library\\share\\eccodes\\definitions"
      
  }
```



