# 0 成本 n8n 工作流，本地電腦一鍵部署 n8n＋ngrok 幫你服務公開存取｜docker compose 馬上搞定｜🧠 省力知識庫

# 0 成本 n8n 工作流 - 2分鐘部署 Demo

* n8n 入門 - <https://github.com/qwedsazxc78/ai-automation-n8n/tree/main/local-ai/basic>

* Docker 安裝 - <https://docs.n8n.io/hosting/installation/docker/>

* 官方進階 local-ai kit （下一集）- <https://github.com/n8n-io/self-hosted-ai-starter-kit>

## 步驟

* 下載 Github 資料夾所有檔案 - <https://github.com/qwedsazxc78/ai-automation-n8n/tree/main/local-ai/basic>

* 對應目錄，終端機下命令  docker-compose up -d

* 註冊 n8n 管理員，拿到 License key

* 下載 demo 檔案 - <https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/15-deploy-n8n-in-local/webhook_healthy_status.json>

* 匯入後，工作流程選啟用

* 確認webhook，收到 ok - <http://localhost:5678/webhook/health>

![image.png](./0%20成本%20n8n%20工作流，本地電腦一鍵部署%20n8n＋ngrok%20幫你服務公開存取｜docker%20compose%20馬上搞定｜🧠%20省力知識庫-assets/image.png)

# 0成本 n8n 工作流介紹

## 為何選擇在本機電腦上使用 n8n！

* 我就是**想省錢**，不想買雲端服務

* **公司政策**，需要部署在地端機房

* **資訊安全**需求，服務不可以再外部

**Zapier / [make.com](make.com) 都沒辦法本地部署！一樣是很好的自動化平台！**

* zapier - <https://zapier.com/>

* make.com - <https://www.make.com/en>

## 本地部署使用服務

* **容器化 docker desktop (window 10/linux/mac)** - <https://www.docker.com/products/docker-desktop/>

* **容器化 orbstack (mac 用戶推薦)** - <https://orbstack.dev/>

* **容器配置工具 docker compose** - <https://docs.docker.com/compose/>

* **本機應用對外服務 ngrok** - <https://ngrok.com/>

## **應用場景（docker compose）**

| 應用情境 | 說明 |
|---|---|
| **本地開發環境建置** | 一鍵啟動包含前端、後端、資料庫的整體開發環境。 |
| **CI/CD 測試環境** | 在 CI 流程中快速建立可重現的測試環境。 |
| **微服務原型開發** | 快速模擬多個服務之間的互動，進行開發與驗證。 |
| **教學與示範** | 利用 Compose 提供學生或開發者完整可執行的範例環境。 |
|  |  |

## 應用場景（Ngrok ）

| 使用情境 | 說明 |
|---|---|
| **Webhook 測試** | 測試如 LINE Bot、Stripe、Shopify、GitHub 等 Webhook 回傳資料。 |
| **展示 Demo** | 在開發階段快速分享應用畫面給客戶或同事觀看。 |
| **遠端除錯與支援** | 工程師可快速開通本地環境，遠端支援除錯。 |
| **本地服務公開** | 將本地的 API、網站、開發工具臨時曝光至外部網路，便於測試整合。 |
| **Chatbot、IoT 模擬** | 模擬接收外部事件的服務，如 Telegram Bot、IoT Gateway 等。 |

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

* 測試第一個應用 webhook 健康檢查

## 5\. 容器部署環境設定

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

* 測試第一個應用 webhook 健康檢查

## 5\. 容器部署環境設定

* n8n

* postgresql

* ngork

* env 環境變數

## 註冊 n8n 管理員，拿到 License key 並啟用

* **註冊畫面**：輸入你的 email ，記得後續要填收到的 license key

* **設定 License key**：進入 n8n 畫面後，點選設定確認版本，點選 Enter activation key 輸入你拿到的License key ，啟用部分的功能。



![image 1.png](./0%20成本%20n8n%20工作流，本地電腦一鍵部署%20n8n＋ngrok%20幫你服務公開存取｜docker%20compose%20馬上搞定｜🧠%20省力知識庫-assets/image%201.png)



![image 2.png](./0%20成本%20n8n%20工作流，本地電腦一鍵部署%20n8n＋ngrok%20幫你服務公開存取｜docker%20compose%20馬上搞定｜🧠%20省力知識庫-assets/image%202.png)

* **再次要求 License key** ：如果沒有收到，點擊上方的 Get paid features for free (forever)，再收一次信看看，記得檢查垃圾郵件。



![image 3.png](./0%20成本%20n8n%20工作流，本地電腦一鍵部署%20n8n＋ngrok%20幫你服務公開存取｜docker%20compose%20馬上搞定｜🧠%20省力知識庫-assets/image%203.png)

# FAQ 常見問題
1. 如何修改專案名稱

   - 點選專案 → 設定

   -
