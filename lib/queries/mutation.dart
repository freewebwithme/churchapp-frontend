const String makeOffering = """
mutation(\$paymentMethodId: String, \$email: String \$amount: String, \$churchId: String) {
  makeOffering(paymentMethodId: \$paymentMethodId, email: \$email, amount: \$amount, churchId: \$churchId){
    amountReceived
    id
    receiptUrl
    status
  }
}
""";
