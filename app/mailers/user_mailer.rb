class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"
  def order_confirm_email(user, order)
    @current_user = user
    # @order_items = LineItem.where(order_id: order_id)
    @order = order
    order_id = @order.id

    mail(to: user.email,
         subject: "Thank you for your purchase. Your order number is #{@order.id}" )
  end
end
