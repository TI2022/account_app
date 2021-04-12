class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy,
                                     :purchasing_show, :purchasing_edit, :purchasing_update, :purchasing_destroy,
                                     :cash_show, :cash_edit, :cash_update, :cash_destroy,
                                     :current_show, :current_edit, :current_update, :current_destroy,
                                     :transfer_slip_edit, :transfer_slip_update, :transfer_slip_destroy]
  
  before_action :logged_in_user, only: [:new, :create, :show, :index, :edit, :update, :destroy,
                                        :purchasing_new, :purchasing_create, :purchasing_show, :purchasing_index, :purchasing_edit, :purchasing_update, :purchasing_destroy,
                                        :cash_new, :cash_create, :cash_show, :cash_index, :cash_edit, :cash_update, :cash_destroy,
                                        :current_new, :current_create, :current_show, :current_index, :current_edit, :current_update, :current_destroy,
                                        :profit_and_loss_statement, :balance_sheet,
                                        :transfer_slip_new, :transfer_slip_create, :transfer_slip_edit, :transfer_slip_update, :transfer_slip_destroy]
                                        
  before_action :admin_and_accounting_user, only: [:new, :create, :show, :index, :edit, :update, :destroy,
                                                   :purchasing_new, :purchasing_create, :purchasing_show, :purchasing_index, :purchasing_edit, :purchasing_update, :purchasing_destroy,
                                                   :cash_new, :cash_create, :cash_show, :cash_index, :cash_edit, :cash_update, :cash_destroy,
                                                   :current_new, :current_create, :current_show, :current_index, :current_edit, :current_update, :current_destroy,
                                                   :profit_and_loss_statement, :balance_sheet,
                                                   :transfer_slip_new, :transfer_slip_create, :transfer_slip_edit, :transfer_slip_update, :transfer_slip_destroy]
  
  before_action :set_one_month, only: [:new, :create, :show, :index, :edit, :update, :destroy,
                                       :purchasing_new, :purchasing_create, :purchasing_show, :purchasing_index, :purchasing_edit, :purchasing_update, :purchasing_destroy,
                                       :cash_new, :cash_create, :cash_show, :cash_index, :cash_edit, :cash_update, :cash_destroy,
                                       :current_new, :current_create, :current_show, :current_index, :current_edit, :current_update, :current_destroy,
                                       :journal_books, :general_ledger, :cash_general_ledger, :current_general_ledger, :payable_general_ledger, :receivable_general_ledger, :purchasing_general_ledger,
                                       :profit_and_loss_statement, :balance_sheet,
                                       :transfer_slip_new, :transfer_slip_create, :transfer_slip_edit, :transfer_slip_update, :transfer_slip_destroy]
                                       
  before_action :cash_initial_deposit, only: [:create, :index, :update, :destroy, :cash_general_ledger,
                                              :purchasing_create, :purchasing_index, :purchasing_edit, :purchasing_update, :purchasing_destroy,
                                              :cash_create, :cash_index, :cash_update, :cash_destroy,
                                              :current_create, :current_index, :current_update, :current_destroy]
  before_action :current_initial_deposit, only: [:create, :index, :update, :destroy, :current_general_ledger,
                                                 :purchasing_create, :purchasing_index, :purchasing_edit, :purchasing_update, :purchasing_destroy,
                                                 :cash_create, :cash_index, :cash_update, :cash_destroy,
                                                 :current_create, :current_index, :current_update, :current_destroy]
                                                 
  before_action :select_account_title, only: [:new, :create, :edit]
  before_action :purchasing_select_account_title, only: [:purchasing_new, :purchasing_create, :purchasing_edit]
  before_action :cash_select_account_title, only: [:cash_new, :cash_create, :cash_edit]
  before_action :current_select_account_title, only: [:current_new, :current_create, :current_edit]
  
  before_action :transfer_slip_account_title, only: [:transfer_slip_new, :transfer_slip_create, :transfer_slip_edit, :transfer_slip_update, :transfer_slip_destroy]
  before_action :assets_account_title, only: [:transfer_slip_new, :transfer_slip_create, :transfer_slip_edit, :transfer_slip_update, :transfer_slip_destroy]
  before_action :liabilities_account_title, only: [:transfer_slip_new, :transfer_slip_create, :transfer_slip_edit, :transfer_slip_update, :transfer_slip_destroy]
  before_action :cost_account_title, only: [:transfer_slip_new, :transfer_slip_create, :transfer_slip_edit, :transfer_slip_update, :transfer_slip_destroy]
  before_action :revenue_account_title, only: [:transfer_slip_new, :transfer_slip_create, :transfer_slip_edit, :transfer_slip_update, :transfer_slip_destroy]
  before_action :tax_rate, only: [:transfer_slip_new, :transfer_slip_create, :transfer_slip_edit, :transfer_slip_update, :transfer_slip_destroy]
  before_action :sub_account_title, only: [:transfer_slip_new, :transfer_slip_create, :transfer_slip_edit, :transfer_slip_update, :transfer_slip_destroy]
  
  
  # --------------------------振替伝票作成-------------------------
  def transfer_slip_new
    @account = Account.new
    @compound_journals = @account.compound_journals.build
  end
  
  def transfer_slip_create
    @account = Account.new(transfer_slip_account_params)
    if @account.save
      flash[:success] = "#{l(@account.accounting_date, format: :long)}の帳簿を新規作成しました。"
      redirect_to transfer_slip_new_accounts_url
    else
      flash[:danger] = "失敗"
      render :transfer_slip_new
    end
  end
  
  def transfer_slip_edit
    @compounds = @account.compound_journals.where(account_id: @account.id)
  end

  def transfer_slip_update
    if @account.update_attributes(transfer_slip_account_params)
      flash[:success] = "#{l(@account.accounting_date, format: :long)}のデータを変更しました。"
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = "入力エラー。"
      redirect_back(fallback_location: root_path)
    end
  end

  def transfer_slip_destroy
    @account.destroy
    flash[:success] = "#{l(@account.accounting_date, format: :long)}のデータを一件削除しました。"
    redirect_back(fallback_location: root_path)
  end
  # -------------------------------------------------------------
  
  # --------------------------売上帳------------------------------
  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if account_invalid?
      sum_breakdown = (account_params[:quantity].to_f * account_params[:unit_price].to_f)
      @account.breakdown = sum_breakdown
      if @account.save
        account_amount_algorithm
        cash_algorithm
        current_algorithm
        account_amount_sum
        flash[:success] = "#{l(@account.accounting_date, format: :long)}の売上帳を新規作成しました。"
        redirect_to new_account_url
      else
        render :new
      end
    else
      flash[:danger] = "複合仕訳欄入力エラー。"
      render :new
    end
  end
  
  def show
  end

  def edit
  end

  def update
    if account_invalid?
      sum_breakdown = (account_params[:quantity].to_f * account_params[:unit_price].to_f)
      @account.breakdown = sum_breakdown
      if @account.update_attributes(account_params)
        account_amount_algorithm
        cash_algorithm
        current_algorithm
        account_amount_sum
        flash[:success] = "#{l(@account.accounting_date, format: :long)}の売上帳情報を変更しました。"
        redirect_back(fallback_location: root_path)
      else
        flash[:danger] = "入力エラー。"
        redirect_back(fallback_location: root_path)
      end
    else
      flash[:danger] = "複合仕訳欄入力エラー。"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @account.destroy
    account_amount_algorithm
    cash_algorithm
    current_algorithm
    account_amount_sum
    flash[:success] = "#{l(@account.accounting_date, format: :long)}の売上帳のデータを一件削除しました。"
    redirect_back(fallback_location: root_path)
  end

  def index
    @accounts = Account.where(subsidiary_journal_species: 4).merge(Account.order("accounts.accounting_date ASC")).merge(Account.order("accounts.customer DESC")).merge(Account.order("accounts.return_check_box ASC"))
    @next_accounts = @accounts.drop(1).push(@accounts.first)
    @before_accounts = @accounts.drop(1).unshift(@accounts.last, @accounts.first)
    @total_amount = 0
    @sales_returns_amount = 0
    z = 0
    @accounts.each do |account|
      if @this_month.include?(Date.parse(account[:accounting_date].to_s))
        if account.return_check_box == "0"
          @total_amount = z += account.breakdown
        end
      end
    end
    z = 0
    @accounts.each do |account|
      if @this_month.include?(Date.parse(account[:accounting_date].to_s))
        if account.return_check_box == "1"
          @sales_returns_amount = z += account.breakdown
        end
      end
    end
    if @total_amount.present? && @sales_returns_amount.present?
      @net_sales = @total_amount - @sales_returns_amount
    end
  end
  # ----------------------------------------------------------------

  # --------------------------仕入帳--------------------------------
  def purchasing_new
    @account = Account.new
  end

  def purchasing_create
    @account = Account.new(purchasing_account_params)
    if purchasing_invalid?
      sum_breakdown = (purchasing_account_params[:quantity].to_f * purchasing_account_params[:unit_price].to_f)
      @account.breakdown = sum_breakdown
      if @account.save
        purchasing_amount_algorithm
        cash_algorithm
        current_algorithm
        purchasing_amount_sum
        flash[:success] = "#{l(@account.accounting_date, format: :long)}の仕入帳を新規作成しました。"
        redirect_to purchasing_new_accounts_url
      else
        flash[:danger] = "入力エラー。"
        render :purchasing_new
      end
    else
      flash[:danger] = "複合仕訳欄入力エラー。"
      render :purchasing_new
    end
  end
  
  def purchasing_show
  end

  def purchasing_edit
  end

  def purchasing_update
    if purchasing_invalid?
      sum_breakdown = (purchasing_account_params[:quantity].to_f * purchasing_account_params[:unit_price].to_f)
      @account.breakdown = sum_breakdown
      if @account.update_attributes(purchasing_account_params)
        purchasing_amount_algorithm
        cash_algorithm
        current_algorithm
        purchasing_amount_sum
        flash[:success] = "#{l(@account.accounting_date, format: :long)}の仕入帳情報を変更しました。"
        redirect_back(fallback_location: root_path)
      else
        flash[:danger] = "入力エラー。"
        redirect_back(fallback_location: root_path)
      end
    else
      flash[:danger] = "複合仕訳欄入力エラー。"
      redirect_back(fallback_location: root_path)
    end
  end

  def purchasing_destroy
    @account.destroy
    purchasing_amount_algorithm
    cash_algorithm
    current_algorithm
    purchasing_amount_sum
    flash[:success] = "#{l(@account.accounting_date, format: :long)}の仕入帳データを一件削除しました。"
    redirect_back(fallback_location: root_path)
  end

  def purchasing_index
    @purchasing_accounts = Account.where(subsidiary_journal_species: 3).merge(Account.order("accounts.accounting_date ASC")).merge(Account.order("accounts.customer DESC")).merge(Account.order("accounts.return_check_box ASC"))
    @purchasing_next_accounts = @purchasing_accounts.drop(1).push(@purchasing_accounts.first)
    @purchasing_before_accounts = @purchasing_accounts.drop(1).unshift(@purchasing_accounts.last, @purchasing_accounts.first)
    @total_purchase_amount = 0
    @stock_returns_amount = 0
    z = 0
    @purchasing_accounts.each do |account|
      if @this_month.include?(Date.parse(account[:accounting_date].to_s))
        if account.return_check_box == "0"
          @total_purchase_amount = z += account.breakdown
        end
      end
    end
    z = 0
    @purchasing_accounts.each do |account|
      if @this_month.include?(Date.parse(account[:accounting_date].to_s))
        if account.return_check_box == "1"
          @stock_returns_amount = z += account.breakdown
        end
      end
    end
    if @total_purchase_amount.present? && @stock_returns_amount.present?
      @net_purchase = @total_purchase_amount - @stock_returns_amount
    end
  end
  # ----------------------------------------------------------------

  # --------------------------現金出納帳----------------------------
  def cash_new
    @account = Account.new
  end

  def cash_create
     @account = Account.new(cash_account_params)
    if cash_invalid?
      if @account.save
        cash_algorithm
        flash[:success] = "#{l(@account.accounting_date, format: :long)}の現金出納帳を新規作成しました。"
        redirect_to cash_new_accounts_url
      else
        flash[:danger] = "入力エラー。"
        render :cash_new
      end
    else
      flash[:danger] = "複合仕訳欄入力エラー。"
      render :cash_new
    end
  end
  
  def cash_show
  end

  def cash_edit
  end

  def cash_update
    if cash_invalid?
      if @account.update_attributes(cash_account_params)
        cash_algorithm
        flash[:success] = "#{l(@account.accounting_date, format: :long)}の現金出納帳情報を変更しました。"
        redirect_back(fallback_location: root_path)
      else
        flash[:danger] = "入力エラー。"
        redirect_back(fallback_location: root_path)
      end
    else
      flash[:danger] = "複合仕訳欄入力エラー。"
      redirect_back(fallback_location: root_path)
    end
  end

  def cash_destroy
    if @account.destroy
      cash_algorithm
      flash[:success] = "#{l(@account.accounting_date, format: :long)}の現金出納帳のデータを一件削除しました。"
      redirect_back(fallback_location: root_path)
    end
  end

  def cash_index
    @cash_accounts = Account.where("account_title = '現金'").or(Account.where("account_title_2 = '現金'")).or(Account.where("account_title_3 = '現金'")).or(Account.where("account_title_4 = '現金'").where("account_title_5 = '現金'")).or(Account.where(subsidiary_journal_species: 1)).merge(Account.order("accounts.accounting_date ASC"))
    
    #@accountsから、今表示されている月【@first_day】以前のデータを全て取得
    @amount_carried_forward = @cash_accounts.select do |c_a|
      c_a.accounting_date < @first_day
    end
    @this_month_last_balance = @cash_accounts.select do |c_a|
      c_a.accounting_date <= @last_day
    end
  end
  # -----------------------------------------------------------------
  
  # --------------------------預金出納帳-------------------------
  def current_new
    @account = Account.new
  end

  def current_create
    @account = Account.new(current_account_params)
    if current_invalid?
      if @account.save
        current_algorithm
        flash[:success] = "#{l(@account.accounting_date, format: :long)}の預金出納帳を新規作成しました。"
        redirect_to current_new_accounts_url
      else
        flash[:danger] = "入力エラー。"
        render :current_new
      end
    else
      flash[:danger] = "複合仕訳欄入力エラー。"
      render :current_new
    end
  end
  
  def current_show
  end

  def current_edit
  end

  def current_update
    if current_invalid?
      if @account.update_attributes(current_account_params)
        current_algorithm
        flash[:success] = "#{l(@account.accounting_date, format: :long)}の預金出納帳情報を変更しました。"
        redirect_back(fallback_location: root_path)
      else
        flash[:danger] = "入力エラー。"
        redirect_back(fallback_location: root_path)
      end
    else
      flash[:danger] = "複合仕訳欄入力エラー。"
      redirect_back(fallback_location: root_path)
    end
  end

  def current_destroy
    @account.destroy
    current_algorithm
    flash[:success] = "#{l(@account.accounting_date, format: :long)}の預金出納帳のデータを一件削除しました。"
    redirect_back(fallback_location: root_path)
  end

  def current_index
    @current_accounts = Account.where("account_title = '預金'").or(Account.where("account_title_2 = '預金'")).or(Account.where("account_title_3 = '預金'")).or(Account.where("account_title_4 = '預金'").where("account_title_5 = '預金'")).or(Account.where(subsidiary_journal_species: 2)).merge(Account.order("accounts.accounting_date ASC"))
    
    #@accountsから、今表示されている月【@first_day】以前のデータを全て取得
    @amount_carried_forward = @current_accounts.select do |c_a|
      c_a.accounting_date < @first_day
    end
    @this_month_last_balance = @current_accounts.select do |c_a|
      c_a.accounting_date <= @last_day
    end
  end
  # ----------------------------------------------------------------
  
  # --------------------------仕訳帳--------------------------------
  def journal_books
    @journal_accounts = Account.all.merge(Account.order("accounts.accounting_date ASC")).merge(Account.order("accounts.subsidiary_journal_species ASC"))
  end
  # ----------------------------------------------------------------
  
  # --------------------------総勘定元帳----------------------------
  def general_ledger
    @general_ledger_accounts = Account.where(subsidiary_journal_species: 4).merge(Account.order("accounts.accounting_date ASC"))
    @amount_carried_forward = @general_ledger_accounts.select do |c_a|
      c_a.accounting_date < @first_day
    end
    @this_month_last_balance = @general_ledger_accounts.select do |c_a|
      c_a.accounting_date <= @last_day
    end
    account_balance_sum
  end
  
  def purchasing_general_ledger
    @general_ledger_accounts = Account.where(subsidiary_journal_species: 3).merge(Account.order("accounts.accounting_date ASC"))
    @amount_carried_forward = @general_ledger_accounts.select do |c_a|
      c_a.accounting_date < @first_day
    end
    @this_month_last_balance = @general_ledger_accounts.select do |c_a|
      c_a.accounting_date <= @last_day
    end
    purchasing_balance_sum
  end
  
  def cash_general_ledger
    @general_ledger_accounts = Account.where("account_title = '現金'").or(Account.where("account_title_2 = '現金'")).or(Account.where("account_title_3 = '現金'")).or(Account.where("account_title_4 = '現金'").where("account_title_5 = '現金'")).or(Account.where(subsidiary_journal_species: 1)).merge(Account.order("accounts.accounting_date ASC"))
    @amount_carried_forward = @general_ledger_accounts.select do |c_a|
      c_a.accounting_date < @first_day
    end
    @this_month_last_balance = @general_ledger_accounts.select do |c_a|
      c_a.accounting_date <= @last_day
    end
    cash_balance_sum
  end
  
  def current_general_ledger
    @general_ledger_accounts = Account.where("account_title = '預金'").or(Account.where("account_title_2 = '預金'")).or(Account.where("account_title_3 = '預金'")).or(Account.where("account_title_4 = '預金'").where("account_title_5 = '預金'")).or(Account.where(subsidiary_journal_species: 2)).merge(Account.order("accounts.accounting_date ASC"))
    @amount_carried_forward = @general_ledger_accounts.select do |c_a|
      c_a.accounting_date < @first_day
    end
    @this_month_last_balance = @general_ledger_accounts.select do |c_a|
      c_a.accounting_date <= @last_day
    end
    current_balance_sum
  end
  
  def payable_general_ledger
    @general_ledger_accounts = Account.where("account_title = '買掛金'").or(Account.where("account_title_2 = '買掛金'")).or(Account.where("account_title_3 = '買掛金'")).or(Account.where("account_title_4 = '買掛金'").where("account_title_5 = '買掛金'")).merge(Account.order("accounts.accounting_date ASC"))
    @amount_carried_forward = @general_ledger_accounts.select do |c_a|
      c_a.accounting_date < @first_day
    end
    @this_month_last_balance = @general_ledger_accounts.select do |c_a|
      c_a.accounting_date <= @last_day
    end
    payable_balance_sum
  end
  
  def receivable_general_ledger
    @general_ledger_accounts = Account.where("account_title = '売掛金'").or(Account.where("account_title_2 = '売掛金'")).or(Account.where("account_title_3 = '売掛金'")).or(Account.where("account_title_4 = '売掛金'").where("account_title_5 = '売掛金'")).merge(Account.order("accounts.accounting_date ASC"))
    @amount_carried_forward = @general_ledger_accounts.select do |c_a|
      c_a.accounting_date < @first_day
    end
    @this_month_last_balance = @general_ledger_accounts.select do |c_a|
      c_a.accounting_date <= @last_day
    end
    receivable_balance_sum
  end
  # ----------------------------------------------------------------

 # --------------------------損益計算書--------------------------------
  def profit_and_loss_statement
    @accounts = Account.where(subsidiary_journal_species: 4).merge(Account.order("accounts.accounting_date ASC")).merge(Account.order("accounts.subsidiary_journal_species ASC"))
    @this_year_first_balance = @accounts.select do |c_a|
      c_a.accounting_date >= @this_year.first
    end
    @this_year_last_balance = @accounts.select do |c_a|
      c_a.accounting_date <= @this_year.last
    end
    
    @purchasing_accounts = Account.where(subsidiary_journal_species: 3).merge(Account.order("accounts.accounting_date ASC")).merge(Account.order("accounts.subsidiary_journal_species ASC"))
    @this_year_first_purchasing_balance = @purchasing_accounts.select do |c_a|
      c_a.accounting_date >= @this_year.first
    end
    @this_year_last_purchasing_balance = @purchasing_accounts.select do |c_a|
      c_a.accounting_date <= @this_year.last
    end
    
    @profit_and_loss_statement_accounts = Account.where(accounting_date: @first_day.all_year).merge(Account.order("accounts.accounting_date ASC")).merge(Account.order("accounts.subsidiary_journal_species ASC"))
    
  end
  # ----------------------------------------------------------------

 # --------------------------貸借対照表--------------------------------
  def balance_sheet
    @balance_sheet_accounts = Account.all.merge(Account.order("accounts.accounting_date ASC")).merge(Account.order("accounts.subsidiary_journal_species ASC"))
    @cash_accounts = Account.where("account_title = '現金'").or(Account.where("account_title_2 = '現金'")).or(Account.where("account_title_3 = '現金'")).or(Account.where("account_title_4 = '現金'").where("account_title_5 = '現金'")).or(Account.where(subsidiary_journal_species: 1)).merge(Account.order("accounts.accounting_date ASC")).merge(Account.order("accounts.subsidiary_journal_species ASC"))
    @current_accounts = Account.where("account_title = '預金'").or(Account.where("account_title_2 = '預金'")).or(Account.where("account_title_3 = '預金'")).or(Account.where("account_title_4 = '預金'").where("account_title_5 = '預金'")).or(Account.where(subsidiary_journal_species: 2)).merge(Account.order("accounts.accounting_date ASC")).merge(Account.order("accounts.subsidiary_journal_species ASC"))
  end
  # ----------------------------------------------------------------

  private
    # ------------------------strong_parameter-----------------------
    def transfer_slip_account_params
      params.require(:account).permit(:accounting_date,
                                      compound_journals_attributes: [
                                      :id,
                                      :account_title,
                                      :amount,
                                      :tax_rate,
                                      :description,
                                      :sub_account_title,
                                      :right_account_title,
                                      :right_amount,
                                      :right_tax_rate,
                                      :right_sub_account_title,
                                      :_destroy
                                      ])
    end
    
    def account_params
      params.require(:account).permit(:accounting_date,
                                      :customer,
                                      :account_title,
                                      :individual_amount,
                                      :account_title_2,
                                      :individual_amount_2,
                                      :account_title_3,
                                      :individual_amount_3,
                                      :account_title_4,
                                      :individual_amount_4,
                                      :account_title_5,
                                      :individual_amount_5,
                                      :product_name,
                                      :quantity,
                                      :unit_price,
                                      :subsidiary_journal_species,
                                      :return_check_box
                                      )
    end
    
    def purchasing_account_params
      params.require(:account).permit(:accounting_date,
                                      :customer,
                                      :account_title,
                                      :account_title_2,
                                      :account_title_3,
                                      :account_title_4,
                                      :account_title_5,
                                      :individual_amount,
                                      :individual_amount_2,
                                      :individual_amount_3,
                                      :individual_amount_4,
                                      :individual_amount_5,
                                      :product_name,
                                      :quantity,
                                      :unit_price,
                                      :subsidiary_journal_species,
                                      :return_check_box
                                      )
    end
    
    def cash_account_params
      params.require(:account).permit(:accounting_date,
                                      :account_title,
                                      :account_title_2,
                                      :account_title_3,
                                      :account_title_4,
                                      :account_title_5,
                                      :individual_amount,
                                      :individual_amount_2,
                                      :individual_amount_3,
                                      :individual_amount_4,
                                      :individual_amount_5,
                                      :description,
                                      :income,
                                      :expense,
                                      :subsidiary_journal_species
                                      )
    end
    
    def current_account_params
      params.require(:account).permit(:accounting_date,
                                      :account_title,
                                      :account_title_2,
                                      :account_title_3,
                                      :account_title_4,
                                      :account_title_5,
                                      :individual_amount,
                                      :individual_amount_2,
                                      :individual_amount_3,
                                      :individual_amount_4,
                                      :individual_amount_5,
                                      :description,
                                      :deposit,
                                      :drawer,
                                      :subsidiary_journal_species
                                      )
    end
    # --------------------------------------------------------------

end
