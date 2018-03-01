class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"
  def order_confirm_email(user, items, order)
    @current_user = user
    @items = items
    @order = order
    order_id = @order.id

    mail(to: user.email,
         subject: "Thank you for your purchase. Your order number is #{@order.id}" )
  end
end
