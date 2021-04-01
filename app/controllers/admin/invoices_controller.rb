# frozen_string_literal: true

module Admin
  class InvoicesController < BaseController
    before_action :order, only: :show

    def new; end

    def show
      @invoice = @order.invoice
      respond_to do |format|
        format.html
        format.pdf do
          render pdf: "Invoice No. #{@invoice.public_uid}",
                 template: 'admin/invoices/show',
                 layout: 'pdf.html',
                 page_size: 'A4',
                 show_as_html: params.key?('debug')
        end
      end
    end

    private

    def order
      @order ||= Order.find(params[:order_id])
      return if @order.invoice.present?

      Invoices::CreateService.call(order: @order)
      @order.reload_invoice
    end
  end
end
