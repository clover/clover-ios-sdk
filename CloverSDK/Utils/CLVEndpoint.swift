//
//  CLVEndpoint.swift
//  CloverSDK
//
//  Created by Yusuf on 3/9/16.
//  Copyright © 2016 Clover Network, Inc. All rights reserved.
//

import Foundation

public enum CLVEndpoint {
  case v3(CLVV3Endpoint)
  case custom(String)
}

public enum CLVV3Endpoint: String {
  // Merchants
  case MERCHANT = "/v3/merchants/{mId}"
  case MERCHANT_ADDRESS = "/v3/merchants/{mId}/address"
  case MERCHANT_GATEWAY = "/v3/merchants/{mId}/gateway"
  case MERCHANT_PROPERTIES = "/v3/merchants/{mId}/properties"
  case MERCHANT_DEFAULT_SERVICE_CHARGE = "/v3/merchants/{mId}/default_service_charge"
  case MERCHANT_TIP_SUGGESTIONS = "/v3/merchants/{mId}/tip_suggestions"
  case MERCHANT_TIP_SUGGESTION = "/v3/merchants/{mId}/tip_suggestions/{tId}"
  case MERCHANT_ORDER_TYPES = "/v3/merchants/{mId}/order_types"
  case MERCHANT_ORDER_TYPE = "/v3/merchants/{mId}/order_types/{orderTypeId}"
  case MERCHANT_ORDER_TYPE_CATEGORIES = "/v3/merchants/{mId}/order_type_categories"
  case MERCHANT_SYSTEM_ORDER_TYPES = "/v3/merchants/{mId}/system_order_types"
  case MERCHANT_ROLES = "/v3/merchants/{mId}/roles"
  case MERCHANT_ROLE = "/v3/merchants/{mId}/roles/{rId}"
  case MERCHANT_TENDERS = "/v3/merchants/{mId}/tenders"
  case MERCHANT_TENDER = "/v3/merchants/{mId}/tenders/{tenderId}"
  case MERCHANT_OPENING_HOURS = "/v3/merchants/{mId}/opening_hours"
  case MERCHANT_OPENING_HOUR = "/v3/merchants/{mId}/opening_hours/{hId}"
  
  // Cash
  case MERCHANT_CASH_EVENTS = "/v3/merchants/{mId}/cash_events"
  case MERCHANT_EMPLOYEE_CASH_EVENTS = "/v3/merchants/{mId}/employees/{empId}/cash_events"
  case MERCHANT_DEVICE_CASH_EVENTS = "/v3/merchants/{mId}/devices/{deviceId}/cash_events"
  
  // Customers
  case MERCHANT_CUSTOMERS_CSV = "/v3/merchants/{mId}/customers.csv"
  case MERCHANT_CUSTOMERS = "/v3/merchants/{mId}/customers"
  case MERCHANT_CUSTOMER = "/v3/merchants/{mId}/customers/{customerId}"
  case MERCHANT_CUSTOMER_PHONE_NUMBERS = "/v3/merchants/{mId}/customers/{customerId}/phone_numbers"
  case MERCHANT_CUSTOMER_PHONE_NUMBER = "/v3/merchants/{mId}/customers/{customerId}/phone_numbers/{phoneId}"
  case MERCHANT_CUSTOMER_EMAIL_ADDRESSES = "/v3/merchants/{mId}/customers/{customerId}/email_addresses"
  case MERCHANT_CUSTOMER_EMAIL_ADDRESS = "/v3/merchants/{mId}/customers/{customerId}/email_addresses/{emailId}"
  case MERCHANT_CUSTOMER_ADDRESSES = "/v3/merchants/{mId}/customers/{customerId}/addresses"
  case MERCHANT_CUSTOMER_ADDRESS = "/v3/merchants/{mId}/customers/{customerId}/addresses/{addressId}"
  case MERCHANT_CUSTOMER_CARDS = "/v3/merchants/{mId}/customers/{customerId}/cards"
  case MERCHANT_CUSTOMER_CARD = "/v3/merchants/{mId}/customers/{customerId}/cards/{cardId}"
  
  // Employees
  case MERCHANT_EMPLOYEES = "/v3/merchants/{mId}/employees"
  case MERCHANT_EMPLOYEE = "/v3/merchants/{mId}/employees/{empId}"
  case MERCHANT_SHIFTS = "/v3/merchants/{mId}/shifts"
  case MERCHANT_SHIFT = "/v3/merchants/{mId}/shifts/{shiftId}"
  case MERCHANT_SHIFTS_CSV = "/v3/merchants/{mId}/shifts.csv"
  case MERCHANT_EMPLOYEE_SHIFTS = "/v3/merchants/{mId}/employees/{empId}/shifts"
  case MERCHANT_EMPLOYEE_SHIFT = "/v3/merchants/{mId}/employees/{empId}/shifts/{shiftId}"
  case MERCHANT_EMPLOYEE_ORDERS = "/v3/merchants/{mId}/employees/{empId}/orders"
  
  // Inventory
  case MERCHANT_ITEMS = "/v3/merchants/{mId}/items"
  case MERCHANT_ITEM = "/v3/merchants/{mId}/items/{itemId}"
  case MERCHANT_ITEM_STOCKS = "/v3/merchants/{mId}/item_stocks"
  case MERCHANT_ITEM_STOCK = "/v3/merchants/{mId}/item_stocks/{itemId}"
  case MERCHANT_ITEM_GROUPS = "/v3/merchants/{mId}/item_groups"
  case MERCHANT_ITEM_GROUP = "/v3/merchants/{mId}/item_groups/{itemGroupId}"
  case MERCHANT_TAGS = "/v3/merchants/{mId}/tags"
  case MERCHANT_TAG = "/v3/merchants/{mId}/tags/{tagId}"
  case MERCHANT_ITEM_TAGS = "/v3/merchants/{mId}/items/{itemId}/tags"
  case MERCHANT_TAG_ITEMS = "/v3/merchants/{mId}/tags/{tagId}/items"
  case MERCHANT_TAG_ITEMS_ = "/v3/merchants/{mId}/tag_items"
  case MERCHANT_TAX_RATES = "/v3/merchants/{mId}/tax_rates"
  case MERCHANT_TAX_RATE = "/v3/merchants/{mId}/tax_rates/{taxId}"
  case MERCHANT_CATEGORIES = "/v3/merchants/{mId}/categories"
  case MERCHANT_CATEGORY = "/v3/merchants/{mId}/categories/{catId}"
  case MERCHANT_CATEGORY_ITEMS = "/v3/merchants/{mId}/categories/{catId}/items"
  case MERCHANT_ITEM_CATEGORIES = "/v3/merchants/{mId}/items/{itemId}/categories"
  case MERCHANT_CATEGORY_ITEMS_ = "/v3/merchants/{mId}/category_items"
  case MERCHANT_TAX_RATE_ITEMS_ = "/v3/merchants/{mId}/tax_rate_items"
  case MERCHANT_TAX_RATE_ITEMS = "/v3/merchants/{mId}/tax_rates/{taxId}/items"
  case MERCHANT_MODIFIER_GROUPS = "/v3/merchants/{mId}/modifier_groups"
  case MERCHANT_MODIFIER_GROUP = "/v3/merchants/{mId}/modifier_groups/{modGroupId}"
  case MERCHANT_ITEM_MODIFIER_GROUPS = "/v3/merchants/{mId}/item_modifier_groups"
  case MERCHANT_MODIFIERS = "/v3/merchants/{mId}/modifiers"
  case MERCHANT_MODIFIER_GROUP_MODIFIERS = "/v3/merchants/{mId}/modifier_groups/{modGroupId}/modifiers"
  case MERCHANT_MODIFIER_GROUP_MODIFIER = "/v3/merchants/{mId}/modifier_groups/{modGroupId}/modifiers/{modId}"
  case MERCHANT_ATTRIBUTES = "/v3/merchants/{mId}/attributes"
  case MERCHANT_ATTRIBUTE = "/v3/merchants/{mId}/attributes/{attributeId}"
  case MERCHANT_OPTIONS = "/v3/merchants/{mId}/options"
  case MERCHANT_ATTRIBUTE_OPTIONS = "/v3/merchants/{mId}/attributes/{attributeId}/options"
  case MERCHANT_ATTRIBUTE_OPTION = "/v3/merchants/{mId}/attributes/{attributeId}/options/{optionId}"
  case MERCHANT_OPTION_ITEMS = "/v3/merchants/{mId}/option_items"
  
  // Notifications
  case APP_MERCHANT_NOTIFICATIONS = "/v3/apps/{aId}/merchants/{mId}/notifications"
  case APP_DEVICE_NOTIFICATIONS = "/v3/apps/{aId}/devices/{dId}/notifications"
  
  // Orders
  case MERCHANT_ORDERS = "/v3/merchants/{mId}/orders"
  case MERCHANT_ORDER = "/v3/merchants/{mId}/orders/{orderId}"
  case MERCHANT_ORDER_DISCOUNTS = "/v3/merchants/{mId}/orders/{orderId}/discounts"
  case MERCHANT_ORDER_DISCOUNT = "/v3/merchants/{mId}/orders/{orderId}/discounts/{discountId}"
  case MERCHANT_ORDER_LINE_ITEMS = "/v3/merchants/{mId}/orders/{orderId}/line_items"
  case MERCHANT_ORDER_LINE_ITEM = "/v3/merchants/{mId}/orders/{orderId}/line_items/{lineItemId}"
  case MERCHANT_ORDER_LINE_ITEM_DISCOUNTS = "/v3/merchants/{mId}/orders/{orderId}/line_items/{lineItemId}/discounts"
  case MERCHANT_ORDER_LINE_ITEM_DISCOUNT = "/v3/merchants/{mId}/orders/{orderId}/line_items/{lineItemId}/discounts/{discountId}"
  case MERCHANT_ORDER_LINE_ITEM_MODIFICATIONS = "/v3/merchants/{mId}/orders/{orderId}/line_items/{lineItemId}/modifications"
  case MERCHANT_ORDER_LINE_ITEM_MODIFICATION = "/v3/merchants/{mId}/orders/{orderId}/line_items/{lineItemId}/modifications/{modifierId}"
  case MERCHANT_ORDER_PAYMENTS = "/v3/merchants/{mId}/orders/{orderId}/payments"
  case MERCHANT_ORDER_SERVICE_CHARGES = "/v3/merchants/{mId}/orders/{orderId}/service_charge/"
  case MERCHANT_ORDER_SERVICE_CHARGE = "/v3/merchants/{mId}/orders/{orderId}/service_charge/{chargeId}"
  case MERCHANT_ORDER_LINE_ITEM_EXCHANGE = "/v3/merchants/{mId}/orders/{orderId}/line_items/{oldLineItemId}/exchange/{lineItemId}"
  
  // Payments
  case MERCHANT_AUTHORIZATIONS = "/v3/merchants/{mId}/authorizations"
  case MERCHANT_AUTHORIZATION = "/v3/merchants/{mId}/authorizations/{authId}"
  case MERCHANT_PAYMENTS = "/v3/merchants/{mId}/payments"
  case MERCHANT_PAYMENT = "/v3/merchants/{mId}/payments/{payId}"
  case MERCHANT_EMPLOYEE_PAYMENTS = "/v3/merchants/{mId}/employees/{empId}/payments"
  case MERCHANT_REFUNDS = "/v3/merchants/{mId}/refunds"
  case MERCHANT_REFUND = "/v3/merchants/{mId}/refunds/{refundId}"
  case MERCHANT_CREDITS = "/v3/merchants/{mId}/credits"
  case MERCHANT_CREDIT = "/v3/merchants/{mId}/credits/{cId}"
  
  // Apps
  case APP_MERCHANT_BILLING_INFO = "/v3/apps/{aId}/merchants/{mId}/billing_info"
  case APP_MERCHANT_METERED = "/v3/apps/{aId}/merchants/{mId}/metereds/{meteredId}"
  case APP_MERCHANT_METERED_EVENT = "/v3/apps/{aId}/merchants/{mId}/metereds/{meteredId}/events/{eventId}"
}
