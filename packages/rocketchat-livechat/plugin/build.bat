@echo off

SET NODE_ENV=production
SET LIVECHAT_DIR=public\livechat
SET LIVECHAT_ASSETS_DIR=private\livechat

SET ROOT=%CD%

del /q /s %LIVECHAT_DIR%
mkdir %LIVECHAT_DIR%

del /q /s %LIVECHAT_ASSETS_DIR%
mkdir %LIVECHAT_ASSETS_DIR%

echo Installing Livechat %LATEST_LIVECHAT_VERSION%...
cd %LIVECHAT_DIR%

copy /y %ROOT%\node_modules\@rocket.chat\livechat\build\* .

call meteor node -e "fs.writeFileSync(^"index.html^", fs.readFileSync(^"index.html^").toString().replace(^"<!DOCTYPE^", ^"<!doctype^"));"

cd %ROOT%\%LIVECHAT_ASSETS_DIR%
copy ..\..\public\livechat\index.html .
