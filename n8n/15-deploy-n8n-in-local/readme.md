# 0 成本 n8n 工作流，本地電腦一鍵部署 n8n＋ngrok 幫你服務公開存取｜docker compose 馬上搞定｜EP15｜🧠 省力知識庫[![YouTube](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)](https://youtu.be/Ictp1DCPUg4)

![EP15 0 成本 n8n 工作流](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/15-deploy-n8n-in-local/cover.png?raw=true)

## 作者資訊

* **作者：** Alexhsieh
* **平台：** n8n（您可以將 `.json` 文件導入自己的 n8n 來查看完整流程）
* **注意事項：** `.json` 文件中已移除所有 API 金鑰

---

## 📌 功能介紹

# Step by Step 教學 - n8n 基本版部署

## 1\. 準備部署環境

* 下載容器應用服務，安裝完成

   - **容器化 docker desktop (window 10/linux/mac)** - <https://www.docker.com/products/docker-desktop/>
   - **容器化 orbstack (mac 用戶推薦)** - <https://orbstack.dev/>

## 2\. 範例專案

* git clone 專案到你的資料夾，或是整個下載 zip 檔案 - <https://github.com/qwedsazxc78/ai-automation-n8n/tree/main/local-ai/basic>

* Readme 說明文檔

## 3\. 啟動服務

* 創建 .env 檔案
* 對應目錄，終端機下命令  docker compose up -d
* 登入 n8n ，註冊工作管理員獲得帳號 - <http://localhost:5678/home/workflows>

## 4\. 部署測試 Workflow

* 下載 Webhook Test Health
* 匯入工作流部署
* 測試第一個應用 webhook 健康檢查 [json檔案連結](https://github.com/qwedsazxc78/ai-automation-n8n/tree/main/n8n/15-deploy-n8n-in-local)

## 5\. 容器部署環境設定介紹

* n8n
* postgresql
* env 環境變數
# Step by Step 教學 - n8n + ngork 版部署

## 1\. 前置作業

* 下載容器應用服務，安裝完成

   - **容器化 docker desktop (window 10/linux/mac)** - <https://www.docker.com/products/docker-desktop/>

   - **容器化 orbstack (mac 用戶推薦)** - <https://orbstack.dev/>

* git clone 專案到你的資料夾，或是整個下載 zip 檔案

* Readme 說明文檔

## 2\. 註冊 ngrok 並取得 Auth Token

* ngork 註冊 - <https://ngrok.com/>

* ngork 使用預設 ngork auth token，貼到 .env 檔案中使用

    - <https://dashboard.ngrok.com/get-started/your-authtoken>

* ngork 連線Agent - <https://dashboard.ngrok.com/agents>

## 3\. 啟動服務

* 創建 .env 檔案
* 對應目錄，終端機下命令  docker compose up -d
* **服務啟動後，ngrok 就會自動幫你產生一組對外的網址**

* 登入 n8n ，註冊工作管理員獲得帳號 - <http://localhost:5678/home/workflows>

## 4\. **取得** ngork **公開網址並更**部署測試 Workflow

* 後台確認 ngork 使用的公開網址
* 複製公開網址，修改變數後，重新啟動 n8n 容器讓設定生效 - **docker compose restart n8n**
* 下載 Webhook Test Health
* 匯入工作流部署
* 測試第一個應用 webhook 健康檢查 - [json檔案連結](https://github.com/qwedsazxc78/ai-automation-n8n/tree/main/n8n/15-deploy-n8n-in-local)

## 5\. 容器部署環境設定

* n8n
* postgresql
* ngork
* env 環境變數
