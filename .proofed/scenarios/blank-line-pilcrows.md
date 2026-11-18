---
name: Show paragraph marks on blank lines
target: desktop
launch: bash .proofed/zettlr/launch.sh
cdp_endpoint: http://127.0.0.1:9314
paths: [source/common/modules/markdown-editor/**]
---
The open note has exactly three lines: "Alpha", an empty line, and "Omega". Paragraph marks are turned on, so a small grey ¶ is drawn at the end of every line, empty lines included. Without typing or clicking, check that three ¶ marks are visible: one after Alpha, one on the empty line between Alpha and Omega, and one after Omega. Stop after this check.
