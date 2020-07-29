class OrderMailer < ApplicationMailer
  default from: 'cleanace@example.com'
  def creation_email(order)
    @order = order
    @order_products = order.order_products
    mail(
      subject: '注文完了メール',
      to: @order.user.email,
      from: 'cleanace@example.com'
    )
  end
end
