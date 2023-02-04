

library(tidyverse)
library(httr)
library(jsonlite)
library(scales)
library(waffle) #install.packages("waffle", repos = "https://cinc.rud.is")
library(ggrepel)
library(data.table)

c("event_timestamp",
"total_price",
"created_date",
"quantity",
"collection_slug",
"contract_address",
"is_private",
"listing_time",
"asset.id",
"asset.name",
"asset.decimals",
"asset.token_id",
# "asset.owner.address",
# "asset.owner.user.username",
"asset_bundle.assets",
"payment_token.symbol",
"payment_token.name",
"payment_token.decimals",
"payment_token.eth_price",
"payment_token.usd_price",
"transaction.timestamp",
"transaction.from_account.address",
"transaction.from_account.user.username",
"seller.address",
"seller.user.username",
"winner_account.address",
"winner_account.user.username")-> Layer_1_events_Info










# 
# 
# c("event_timestamp",
#   "total_price",
#   "created_date",
#   "quantity",
#   "collection_slug",
#   "contract_address",
#   "dev_seller_fee_basis_points",
#   "is_private",
#   "listing_time",
#   "asset.id",
#   "asset.num_sales",
#   "asset.name",
#   "asset.decimals",
#   "asset.token_id",
#   "asset.asset_contract.address",
#   "asset.asset_contract.created_date",
#   "asset.asset_contract.dev_seller_fee_basis_points",
#   "asset.asset_contract.only_proxied_transfers",
#   "asset.asset_contract.opensea_seller_fee_basis_points",
#   "asset.asset_contract.seller_fee_basis_points",
#   "asset.collection.created_date",
#   "asset.collection.dev_seller_fee_basis_points",
#   "asset.collection.hidden",
#   "asset.collection.safelist_request_status",
#   "asset.collection.is_subject_to_whitelist",
#   "asset.collection.only_proxied_transfers",
#   "asset.collection.opensea_seller_fee_basis_points",
#   "asset.collection.payout_address",
#   "asset.owner.address",
#   "asset.owner.config",
#   "asset.owner.user.username",
#   "asset_bundle.assets",
#   "asset_bundle.asset_contract.dev_seller_fee_basis_points",
#   "asset_bundle.asset_contract.only_proxied_transfers",
#   "asset_bundle.asset_contract.opensea_seller_fee_basis_points",
#   "asset_bundle.asset_contract.seller_fee_basis_points",
#   "asset_bundle.asset_contract.collection.dev_seller_fee_basis_points",
#   "asset_bundle.asset_contract.collection.opensea_seller_fee_basis_points",
#   "asset_bundle.asset_contract.collection.require_email",
#   "payment_token.symbol",
#   "payment_token.name",
#   "payment_token.decimals",
#   "payment_token.eth_price",
#   "payment_token.usd_price",
#   "transaction.timestamp",
#   "transaction.from_account.address",
#   "transaction.from_account.user.username",
#   "seller.address",
#   "seller.user.username",
#   "winner_account.address",
#   "winner_account.user.username",
#   "transaction.transaction_hash") -> Layer_1_events_Info


c("id",
  "name",
  "token_id",
  "asset_contract.address",
  "asset_contract.created_date"
  # "asset_contract.dev_seller_fee_basis_points",
  # "asset_contract.only_proxied_transfers",
  # "asset_contract.opensea_seller_fee_basis_points",
  # "asset_contract.seller_fee_basis_points",
  # "collection.created_date",
  # "collection.default_to_fiat",
  # "collection.dev_seller_fee_basis_points",
  # "collection.featured",
  # "collection.hidden",
  # "collection.is_subject_to_whitelist",
  # # "collection.opensea_seller_fee_basis_points",
  # "owner.user.username",
  # "owner.address",
  # "owner.config"
  ) -> Layer_2_Estates




