class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  include StaticPagesHelper
  include SessionsHelper
  include UsersHelper
  include GroundsHelper
  include LandingsHelper
  include AccountsHelper

  $days_of_the_week = %w{日 月 火 水 木 金 土}
  
  # beforフィルター
  # paramsハッシュからユーザーを取得します。
  def set_user
    @user = User.find(params[:id])
  end
  
  def set_account
    @account = Account.find(params[:id])
  end
  
  def set_accounts
    @accounts = Account.includes(:compound_journals).merge(Account.order("accounts.accounting_date ASC"))
  end
  
  # ログイン済みのユーザーか確認します。
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください。"
      redirect_to login_url
    end
  end
  
  # アクセスしたユーザーが現在ログインしているユーザーか確認します。
  def correct_user
    redirect_to(root_url) unless current_user?(@user)
  end
  
  def uncorrect_user
    redirect_to(root_url) if current_user?(@user)
  end
  
  # システム管理権限所有かどうか判定します。
  def admin_user
    redirect_to root_url unless current_user.admin?
  end
  
  def accounting_user
    redirect_to root_url unless current_user.accounting?
  end
  
  def admin_and_accounting_user
    redirect_to root_url unless current_user.accounting? || current_user.admin?
  end
  
  # 管理者は許可しない
  def invalid_admin_user
    redirect_to root_url if current_user.admin?
  end
  
  # 管理者または、アクセスしたユーザーが現在ログインしているユーザーだった場合許可
  def admin_or_correct_user
    redirect_to(root_url) unless current_user.admin? || current_user?(@user)
  end
  
  def set_one_month
    @first_day = params[:accounting_date].nil? ? Date.current.beginning_of_month : params[:accounting_date].to_date
    @last_day = @first_day.end_of_month
    @one_month = [*@first_day..@last_day]
    @this_month = @first_day.all_month
    @today = Date.current
    @this_year = @first_day.all_year
    @prev_year = @today.prev_year.all_year
  end
  
  # before_action

    def ocr_right_account_titles
      @ocr_right_account_titles = [
                                    ["会社のお金で現金で支払った：現金","現金"],
                                    ["個人のお金で現金で支払った：事業主借","事業主借"]
                                  ]
    end

    def ocr_account_titles
      @ocr_account_titles = [
                              ["カフェで一人会費をした：会議費","会議費"],
                              ["お客さんと会食した：接待交際費","接待交際費"],
                              ["仕事上で研究や視察を目的とした飲食代：研究費","研究費"]
                            ]
    end
  
    # 税率用()--view()
    def tax_rate_arys
      @tax_rate_arys = [["対象外", 0],["8%", 1],["10%", 2]]
    end
    # -----------------------------------------
    
    # 補助勘定科目用(select_box選択用)--view()
    def sub_account_titles
      @sub_account_titles = %w[住民税
                              源泉所得税
                              介護保険料（事業主負担分）
                              介護保険料（預り分）
                              雇用保険料（事業主負担分）
                              雇用保険料（預り分）
                              健康保険料（事業主負担分）
                              健康保険料（預り分）
                              厚生年金保険料（事業主負担分）
                              厚生年金保険料（預り分）
                              基本給
                              残業代
                              通勤手当
                              報酬源泉（毎月）
                              ]
    end
    # -----------------------------------------
    
    # 振替伝票勘定科目用(のselect_box選択用)--view()
    def transfer_slip_account_titles
      @transfer_slip_account_titles = %w[現金
                                        普通預金
                                        普通預金2
                                        当座預金
                                        定期預金
                                        郵便貯金
                                        受取手形
                                        売掛金
                                        商品
                                        製品
                                        原材料
                                        仕掛品
                                        前払金
                                        前払費用
                                        立替金
                                        仮払金
                                        仮払消費税
                                        未収金
                                        短期貸付金
                                        有価証券
                                        建物
                                        機械装置
                                        車両運搬具
                                        工具器具備品
                                        一括償却資産
                                        減価償却累計額
                                        土地
                                        電話加入権
                                        ソフトウェア
                                        敷金
                                        差入保証金
                                        長期貸付金
                                        創立費
                                        開業費
                                        買掛金
                                        支払手形
                                        短期借入金
                                        未払金
                                        未払費用
                                        前受金
                                        預り金
                                        源泉税等預り金
                                        仮受金
                                        仮受消費税
                                        賞与引当金
                                        役員賞与引当金
                                        未払法人税等
                                        未払事業税等
                                        未払消費税等
                                        長期借入金
                                        資本金
                                        資本剰余金
                                        資本準備金
                                        別途積立金
                                        売上割引
                                        外注加工費
                                        期首商品棚卸高
                                        仕入
                                        火災損失
                                        前期利益修正損
                                        固定資産売却損
                                        法人税･住民税及び事業税
                                        給料手当
                                        役員報酬
                                        役員賞与
                                        雑給
                                        賞与手当
                                        退職金
                                        法定福利費
                                        福利厚生費
                                        採用教育費
                                        通信費
                                        荷造運賃
                                        水道光熱費
                                        車両費
                                        旅費交通費
                                        広告宣伝費
                                        販売手数料
                                        接待交際費
                                        少額交際費
                                        会議費
                                        消耗品費
                                        事務用品費
                                        備品消耗品
                                        新聞図書費
                                        修繕費
                                        地代家賃
                                        建物付属設備
                                        支払保険料
                                        租税公課
                                        諸会費
                                        賃借料
                                        支払手数料
                                        支払利息
                                        利子割引料
                                        社債利息
                                        有価証券評価損
                                        貸倒損失
                                        減価償却費
                                        研究開発費
                                        寄附金
                                        雑損失
                                        雑費
                                        売上
                                        仕入値引
                                        期末商品棚卸高
                                        受取利息
                                        有価証券利息
                                        有価証券売却益
                                        受取配当金
                                        雑収入
                                        前期利益修正益
                                        固定資産売却益
                                        ]
    end
    # -----------------------------------------
    
    # 借貸判定用()--helper()　借方
    def left_account_titles
      @left_account_titles = %w[現金
                                普通預金
                                普通預金2
                                当座預金
                                定期預金
                                郵便貯金
                                受取手形
                                売掛金
                                商品
                                製品
                                原材料
                                仕掛品
                                前払金
                                前払費用
                                立替金
                                仮払金
                                仮払消費税
                                未収金
                                短期貸付金
                                有価証券
                                建物
                                機械装置
                                車両運搬具
                                工具器具備品
                                一括償却資産
                                減価償却累計額
                                土地
                                電話加入権
                                ソフトウェア
                                敷金
                                差入保証金
                                長期貸付金
                                創立費
                                開業費
                                売上割引
                                外注加工費
                                期首商品棚卸高
                                仕入
                                雑損失
                                火災損失
                                前期利益修正損
                                固定資産売却損
                                法人税･住民税及び事業税
                                給料手当
                                役員報酬
                                役員賞与
                                雑給
                                賞与手当
                                退職金
                                法定福利費
                                福利厚生費
                                採用教育費
                                通信費
                                荷造運賃
                                水道光熱費
                                旅費交通費
                                広告宣伝費
                                販売手数料
                                接待交際費
                                少額交際費
                                会議費
                                消耗品費
                                事務用品費
                                備品消耗品
                                新聞図書費
                                修繕費
                                地代家賃
                                建物付属設備
                                車両費
                                支払保険料
                                租税公課
                                諸会費
                                賃借料
                                支払手数料
                                支払利息
                                利子割引料
                                社債利息
                                有価証券評価損
                                貸倒損失
                                減価償却費
                                研究開発費
                                寄附金
                                雑費
                                ]
    end
    # -----------------------------------------
    
    # 借貸判定用()--helper()　貸方
    def right_account_titles
      @right_account_titles = %w[買掛金
                                支払手形
                                短期借入金
                                未払金
                                未払費用
                                前受金
                                預り金
                                源泉税等預り金
                                仮受金
                                仮受消費税
                                賞与引当金
                                役員賞与引当金
                                未払法人税等
                                未払事業税等
                                未払消費税等
                                長期借入金
                                資本金
                                資本剰余金
                                資本準備金
                                利益準備金
                                別途積立金
                                繰越利益剰余金
                                売上
                                仕入値引
                                期末商品棚卸高
                                受取利息
                                有価証券利息
                                有価証券売却益
                                受取配当金
                                雑収入
                                前期利益修正益
                                固定資産売却益
                                ]
    end
    # -----------------------------------------
    
    
    # 損益計算書
      # 売上高
      def amount_of_sales
        @amount_of_sales = %w[売上]
      end
      # 売上原価
      def cost_of_sales
        @cost_of_sales = %w[期首商品棚卸高
                            仕入
                            期末商品棚卸高
                            外注加工費
                            ]
      end
      # 販売費及一般管理費
      def administrative_expenses
        @administrative_expenses = %w[給料手当
                                      役員報酬
                                      役員賞与
                                      雑給
                                      賞与手当
                                      退職金
                                      法定福利費
                                      福利厚生費
                                      採用教育費
                                      通信費
                                      荷造運賃
                                      水道光熱費
                                      車両費
                                      旅費交通費
                                      広告宣伝費
                                      販売手数料
                                      接待交際費
                                      少額交際費
                                      会議費
                                      消耗品費
                                      事務用品費
                                      備品消耗品
                                      新聞図書費
                                      修繕費
                                      租税公課
                                      支払手数料
                                      諸会費
                                      賃借料
                                      支払家賃
                                      地代家賃
                                      減価償却費
                                      貸倒損失
                                      ]
      end
      # 営業外収益
      def non_operating_income
        @non_operating_income = %w[受取利息
                                   有価証券利息
                                   有価証券売却益
                                   受取配当金
                                   仕入値引
                                   雑収入
                                   ]
      end
      # 営業外費用
      def non_operating_expenses
        @non_operating_expenses = %w[売上割引
                                     支払利息
                                     利子割引料
                                     社債利息
                                     有価証券評価損
                                     研究開発費
                                     寄附金
                                     雑損失
                                     雑費
                                     ]
      end
      # 特別利益
      def extraordinary_gains
        @extraordinary_gains = %w[固定資産売却益
                                  前期利益修正益
                                  ]
      end
      # 特別損失
      def extraordinary_loss
        @extraordinary_loss = %w[固定資産売却損
                                 火災損失
                                 前期利益修正損
                                 ]
      end
      
      # 法人税･住民税及び事業税
      def corporate_inhabitant_and_enterprise_taxes
        @corporate_inhabitant_and_enterprise_taxes = %w[法人税･住民税及び事業税]
      end
    # -----------------------------------------
    
    
    
    
    
    
    
    
    
    
    
    
    
    # 貸借対照表
      # 現金/預金
      def cash_deposits
        @cash_deposits = %w[現金
                            普通預金
                            普通預金2
                            当座預金
                            郵便貯金
                            定期預金
                            ]
      end
      # 売上債権
      def trade_receivables
        @trade_receivables = %w[受取手形
                                売掛金
                                ]
      end
      # 棚卸資産
      def inventories
        @inventories = %w[商品
                          製品
                          原材料
                          仕掛品
                          ]
      end
      # 他流動資産
      def other_current_assets
        @other_current_assets = %w[仮払金
                                   前払金
                                   前払費用
                                   立替金
                                   未収金
                                   短期貸付金
                                   有価証券
                                   敷金
                                   支払保険料
                                   ]
      end
      
      # 有形固定資産
      def tangible_fixed_assets
        @tangible_fixed_assets = %w[建物
                                    機械装置
                                    車両運搬具
                                    工具器具備品
                                    一括償却資産
                                    減価償却累計額
                                    土地
                                    建物付属設備
                                    ]
      end
      # 無形固定資産
      def intangible_fixed_assets
        @intangible_fixed_assets = %w[電話加入権
                                      ソフトウェア
                                      ]
      end
      # 投資、他固定資産
      def other_fixed_assets
        @other_fixed_assets = %w[敷金
                                 差入保証金
                                 長期貸付金
                                 ]
      end
      
      # 繰延資産 
      def deferred_assets
        @deferred_assets = %w[創立費
                              開業費
                              ]
      end
      
      # 仕入債務
      def accounts_payable_trades
        @accounts_payable_trades = %w[買掛金
                                      支払手形
                                      ]
      end
      
      # 他流動負債
      def other_current_liabilities
        @other_current_liabilities = %w[短期借入金
                                        未払金
                                        未払費用
                                        前受金
                                        預り金
                                        源泉税等預り金
                                        仮受金
                                        賞与引当金
                                        役員賞与引当金
                                        未払法人税等
                                        未払事業税等
                                        ]
      end
      
      # 固定負債
      def fixed_liabilities
        @fixed_liabilities = %w[長期借入金]
      end
      
      # 資本金
      def capital_stocks
        @capital_stocks = %w[資本金
                             資本剰余金
                             資本準備金]
      end
      # 利益剰余金
      def retained_earnings
        @retained_earnings = %w[利益準備金]
      end
    # -----------------------------------------
   
end