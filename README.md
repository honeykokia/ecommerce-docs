# E-Commerce Docs

本專案為 **電商系統設計與規劃文件**，包含 **API 規格、資料庫結構、ER 圖、功能模組、用例圖** 等。  
此 repo 作為 **前端（Vue 3）與後端（Spring Boot）專案的共同設計基礎**，透過 Git submodule 引用，確保 API 與資料結構的一致性。

---

## 📂 目錄結構

- `docs/api-spec.yaml`：OpenAPI 3.0 API 規格
- `docs/database-schema.sql`：PostgreSQL 建表 SQL
- `docs/er-diagram.puml`：ER 圖（PlantUML 格式）
- `docs/feature-modules.yaml`：功能模組規劃
- `docs/feature-usecase.puml`：用例圖（PlantUML 格式）

---

## 🛠 功能模組設計

- **使用者模組**：註冊、登入、個人資訊、忘記密碼、購買紀錄  
- **商品模組**：商品列表、詳情、分類、搜尋  
- **活動模組**：活動列表、詳情、分類  
- **購物車模組**：加入 / 移除 / 修改商品、購物車清單  
- **訂單模組**：建立訂單、訂單詳情、狀態追蹤  
- **管理後台模組**：商品 / 訂單 / 使用者 / 活動 / 類別管理  
- **支付模組**：整合綠界 ECPay，模擬付款、處理 callback、交易狀態更新  

---

## 🔗 API 規格

完整 API 規格請參考 [api-spec.yaml](docs/api-spec.yaml)。  
常見端點如下：

- **訂單建立**：`POST /orders/me`  
  - 請求：[`CreateOrderRequest`](docs/api-spec.yaml)  
  - 回應：[`CreateOrderResponse`](docs/api-spec.yaml)  

- **付款結帳**：`POST /payments/checkout`  
  - 請求：[`PaymentCheckoutRequest`](docs/api-spec.yaml)  
  - 回應：跳轉至 ECPay 付款頁面  

- **付款結果查詢**：`POST /payments/result`  
  - 請求：[`EcpayServerResult`](docs/api-spec.yaml)  

---

## 🗄 資料庫設計

- 使用 **PostgreSQL**  
- 支援商品、訂單、購物車、活動、標籤、付款等完整資料表  
- 關聯設計詳見 [ER 圖](docs/er-diagram.puml)  

文件入口：  
- [資料庫結構 (SQL)](docs/database-schema.sql)  
- [ER 圖 (PlantUML)](docs/er-diagram.puml)  

---

## 🖥 專案結構

本系統採取 **前後端分離架構**：  

- 前端：[ecommerce-vue](https://github.com/honeykokia/ecommerce-vue) (Vue 3 + TailwindCSS)  
- 後端：[ecommerce-springboot](https://github.com/honeykokia/ecommerce-springboot) (Spring Boot + PostgreSQL + JWT)  
- 文件：[ecommerce-docs](https://github.com/honeykokia/ecommerce-docs) (本 repo)  

> 📌 文件 repo 以 **sub-repository** 方式引用，更新 API 或 DB 設計時，前後端可保持同步。

---

## 📑 文件快速入口

| 文件類型 | 位置 |
|----------|------|
| API 規格 | [docs/api-spec.yaml](docs/api-spec.yaml) |
| 資料庫 Schema | [docs/database-schema.sql](docs/database-schema.sql) |
| ER 圖 | [docs/er-diagram.puml](docs/er-diagram.puml) |
| 功能模組 | [docs/feature-modules.yaml](docs/feature-modules.yaml) |
| 用例圖 | [docs/feature-usecase.puml](docs/feature-usecase.puml) |

---

## 🚀 開發流程建議

1. **需求變更時** → 先更新 `docs/` 下的 API 或 DB 設計  
2. **同步到前後端 repo** → 確保程式碼與文件一致  

---