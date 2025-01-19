I figure it out. In the `.vscode/launch.json`, paste the following code

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "clang++ - build and debug active file",
      "type": "cppdbg",
      "request": "launch",
      "program": "${workspaceFolder}/Scotty3D",
      "args": [],
      "stopAtEntry": false,
      "cwd": "${workspaceFolder}",
      "environment": [],
      "externalConsole": false,
      "MIMode": "lldb"
    }
  ]
}
```
