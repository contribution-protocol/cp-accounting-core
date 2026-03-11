# CRM ↔ Accounting Interface Specification

This document defines the minimal interface between CRM systems
and the CP Accounting Core.

CRM systems must never access the Accounting database directly.
All issuance requests must pass through this interface.

---

## 1. Token Issuance

Endpoint

POST /mint

Parameters

issue_id    : string   (CRM event identifier)
amount      : integer  (token amount)
expires_at  : datetime (expiry timestamp)
memo        : string   (optional)

Description

Requests token issuance from the Accounting Core.
The Accounting system performs reserve validation internally.

---

## 2. Status Query

Endpoint

GET /status/{issue_id}

Response

{
  "status": "active | expired"
}

Description

Returns the current status of the issued tokens.


---
# CRM ↔ 会計コア 接続仕様

本ドキュメントは、CRMシステムとCP会計コア（Accounting Core）との
最小インターフェースを定義する。

CRMシステムは会計データベースへ直接アクセスしてはならない。
すべての発行依頼は、このインターフェースを通して行う。

---

## 1. トークン発行

Endpoint

POST /mint

パラメータ

issue_id    : string   （CRM側のイベント識別子）
amount      : integer  （発行するトークン量）
expires_at  : datetime （失効日時）
memo        : string   （任意）

説明

会計コアに対してトークン発行を依頼する。
引当残高の確認などの検証処理は、会計システム内部で実行される。

---

## 2. 状態確認

Endpoint

GET /status/{issue_id}

レスポンス

{
  "status": "active | expired"
}

説明

指定された issue_id に対応するトークンの現在の状態を返す。