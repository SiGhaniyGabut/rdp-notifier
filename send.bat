@echo off
setlocal enabledelayedexpansion
for /f "tokens=3" %%a in ('sc query ngrok ^| findstr "STATE"') do (
    set state=%%a
)
if "!state!"=="RUNNING" (
    echo NGROK was running in background...
) else (
    echo starting NGROK service...
    ngrok service start
)


echo Sending Hostname and Port information...

ruby main.rb
