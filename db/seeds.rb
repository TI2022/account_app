User.create!(name: "管理者",
             email: "admin@email.com",
             password: "admin_p",
             password_confirmation: "admin_p",
             admin: true)

User.create!(name: "経理",
             email: "account@email.com",
             password: "account_p",
             password_confirmation: "account_p",
             accounting: true)

User.create!(name: "一般テストユーザー",
             email: "test@email.com",
             password: "test_p",
             password_confirmation: "test_p"
             )

User.create!(name: "ゲストユーザー",
             email: "guest@email.com",
             password: "guest_password",
             password_confirmation: "guest_password"
            )

Ground.create!(fishing_ground_name: "四丁目",
              )

Ground.create!(fishing_ground_name: "三丁目",
              )

Ground.create!(fishing_ground_name: "三貫",
              )

Ground.create!(fishing_ground_name: "汐折",
              )

Ground.create!(fishing_ground_name: "ほっちょうか",
              )

Ground.create!(fishing_ground_name: "下り松",
              )

Ground.create!(fishing_ground_name: "白崎",
              )

Ground.create!(fishing_ground_name: "釜沖",
              )

Ground.create!(fishing_ground_name: "小松",
              )

Ground.create!(fishing_ground_name: "金島",
              )

Ground.create!(fishing_ground_name: "大建",
              )

Ground.create!(fishing_ground_name: "仲網",
              )


compound_journal_attribute1 = {
  accounting_date: '2021-03-02',
  compound_journals_attributes: [
    {
      account_title: "現金",
      amount: "2000000",
      right_account_title: "普通預金",
      right_amount: "2000000",
      tax_rate: "",
      description: "普通預金から200,000円を引き出した。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute1)

compound_journal_attribute2 = {
  accounting_date: '2021-01-02',
  compound_journals_attributes: [
    {
      account_title: "当座預金",
      amount: "200000",
      right_account_title: "普通預金",
      right_amount: "200000",
      tax_rate: "",
      description: "当座預金へ普通預金から200,000円を入金した。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute2)

compound_journal_attribute3 = {
  accounting_date: '2021-01-02',
  compound_journals_attributes: [
    {
      account_title: "定期預金",
      amount: "200000",
      right_account_title: "現金",
      right_amount: "200000",
      tax_rate: "",
      description: "現金200,000円を定期預金に入金した。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute3)

compound_journal_attribute4 = {
  accounting_date: '2021-02-02',
  compound_journals_attributes: [
    {
      account_title: "普通預金",
      amount: "200000",
      right_account_title: "現金",
      right_amount: "200000",
      tax_rate: "",
      description: "現金200,000円を普通預金に入金した。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute4)

compound_journal_attribute5 = {
  accounting_date: '2021-04-02',
  compound_journals_attributes: [
    {
      account_title: "受取手形",
      amount: "200000",
      right_account_title: "売掛金",
      right_amount: "200000",
      tax_rate: "",
      description: "株式会社サンプルの売掛金200,000円を株式会社サンプル振出の約束手形で受け取った。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute5)

compound_journal_attribute6 = {
  accounting_date: '2021-05-02',
  compound_journals_attributes: [
    {
      account_title: "定期預金",
      amount: "216000",
      right_account_title: "現金",
      right_amount: "200000",
      tax_rate: "",
      description: "株式会社サンプルへ商品216,000円（税込）を掛けで販売した。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    },
    {
      account_title: "",
      amount: "",
      right_account_title: "仮受消費税",
      right_amount: "16000",
      tax_rate: "",
      description: "株式会社サンプルへ商品216,000円（税込）を掛けで販売した。",
      sub_account_title: "",
      right_tax_rate: "8",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute6)

compound_journal_attribute7 = {
  accounting_date: '2021-03-02',
  compound_journals_attributes: [
    {
      account_title: "有価証券",
      amount: "105000",
      right_account_title: "現金",
      right_amount: "105000",
      tax_rate: "",
      description: "株券100,000円を手数料5,000円と一緒に現金で購入した。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute7)

compound_journal_attribute8 = {
  accounting_date: '2021-03-06',
  compound_journals_attributes: [
    {
      account_title: "商品",
      amount: "25000000",
      right_account_title: "期末商品棚卸高",
      right_amount: "25000000",
      tax_rate: "",
      description: "決算にあたり、期末在庫商品を25,000,000円と評価した。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute8)

compound_journal_attribute9 = {
  accounting_date: '2021-02-02',
  compound_journals_attributes: [
    {
      account_title: "前払金",
      amount: "50000",
      right_account_title: "現金",
      right_amount: "50000",
      tax_rate: "",
      description: "備品購入の際に手付金として50,000円を現金で渡した。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute9)

compound_journal_attribute10 = {
  accounting_date: '2021-01-02',
  compound_journals_attributes: [
    {
      account_title: "短期貸付金",
      amount: "5000000",
      right_account_title: "普通預金",
      right_amount: "5000000",
      tax_rate: "",
      description: "取引先へ返済期間3ヶ月後として5,000,000円を普通預金から貸し付けた。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute10)

compound_journal_attribute11 = {
  accounting_date: '2021-04-02',
  compound_journals_attributes: [
    {
      account_title: "未収金",
      amount: "432000",
      right_account_title: "車両運搬具",
      right_amount: "500000",
      tax_rate: "",
      description: "軽トラック（簿価500,000円）を432,000円（税込）で売却し、代金は後日受け取る。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    },
    {
      account_title: "固定資産売却損",
      amount: "100000",
      right_account_title: "仮受消費税",
      right_amount: "32000",
      tax_rate: "",
      description: "",
      sub_account_title: "",
      right_tax_rate: "8",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute11)

compound_journal_attribute12 = {
  accounting_date: '2021-03-11',
  compound_journals_attributes: [
    {
      account_title: "仮払金",
      amount: "70000",
      right_account_title: "現金",
      right_amount: "70000",
      tax_rate: "",
      description: "社員が出張費70,000円を現金で仮払いした。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute12)

compound_journal_attribute13 = {
  accounting_date: '2021-03-11',
  compound_journals_attributes: [
    {
      account_title: "立替金",
      amount: "620",
      right_account_title: "現金",
      right_amount: "620",
      tax_rate: "",
      description: "顧問先へ送る書類の郵便代（620円）を事務所が支払った。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute13)

compound_journal_attribute14 = {
  accounting_date: '2021-03-21',
  compound_journals_attributes: [
    {
      account_title: "建物",
      amount: "6000000",
      right_account_title: "当座預金",
      right_amount: "6000000",
      tax_rate: "",
      description: "倉庫を6,000,000円で購入し、小切手で支払った。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute14)

compound_journal_attribute15 = {
  accounting_date: '2021-02-11',
  compound_journals_attributes: [
    {
      account_title: "建物付属設備",
      amount: "450000",
      right_account_title: "未払金",
      right_amount: "450000",
      tax_rate: "",
      description: "クーラーを450,000円で購入し代金は来月末支払う予定。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute15)

compound_journal_attribute16 = {
  accounting_date: '2021-03-11',
  compound_journals_attributes: [
    {
      account_title: "機械装置",
      amount: "4500000",
      right_account_title: "未払金",
      right_amount: "4000000",
      tax_rate: "",
      description: "印刷機を4,500,000円で購入した。設置・調整費用は現金で500,000円を支払い
残りは来月、小切手で支払う予定。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    },
    {
      account_title: "",
      amount: "",
      right_account_title: "現金",
      right_amount: "500000",
      tax_rate: "",
      description: "",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute16)

compound_journal_attribute17 = {
  accounting_date: '2021-04-21',
  compound_journals_attributes: [
    {
      account_title: "車両運搬具",
      amount: "2000000",
      right_account_title: "未払金",
      right_amount: "2000000",
      tax_rate: "",
      description: "トラックを2,000,000円で購入し代金は後で支払う予定。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute17)

compound_journal_attribute18 = {
  accounting_date: '2021-04-11',
  compound_journals_attributes: [
    {
      account_title: "工具器具備品",
      amount: "800000",
      right_account_title: "未払金",
      right_amount: "800000",
      tax_rate: "",
      description: "コピー機を800,000円で購入し代金は後で支払う予定。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute18)

compound_journal_attribute19 = {
  accounting_date: '2021-03-21',
  compound_journals_attributes: [
    {
      account_title: "土地",
      amount: "1500000",
      right_account_title: "未払金",
      right_amount: "1500000",
      tax_rate: "",
      description: "資材置き場の土地を1,5000,000円で購入し代金は後で支払う予定。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute19)

compound_journal_attribute20 = {
  accounting_date: '2021-02-18',
  compound_journals_attributes: [
    {
      account_title: "現金",
      amount: "50000",
      right_account_title: "電話加入権",
      right_amount: "70000",
      tax_rate: "",
      description: "電話加入権（70,000円）を50,000円でＡ社に譲渡し、現金で受け取った。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    },
    {
      account_title: "固定資産売却損",
      amount: "20000",
      right_account_title: "",
      right_amount: "",
      tax_rate: "",
      description: "",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute20)

compound_journal_attribute21 = {
  accounting_date: '2021-01-21',
  compound_journals_attributes: [
    {
      account_title: "仕入",
      amount: "100000",
      right_account_title: "支払手形",
      right_amount: "100000",
      tax_rate: "",
      description: "Ａ商店から商品を100,000円（税抜）で仕入れ、支払は約束手形を振り出して支払った。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute21)

compound_journal_attribute22 = {
  accounting_date: '2021-03-21',
  compound_journals_attributes: [
    {
      account_title: "仕入",
      amount: "100000",
      right_account_title: "買掛金",
      right_amount: "100000",
      tax_rate: "",
      description: "Ａ商店から商品100,000円（税抜）を掛けで仕入れた。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute22)

compound_journal_attribute23 = {
  accounting_date: '2021-01-21',
  compound_journals_attributes: [
    {
      account_title: "短期借入金",
      amount: "200000",
      right_account_title: "当座預金",
      right_amount: "208000",
      tax_rate: "",
      description: "借入金のうち、200,000円を利息8,000円とともに当座預金から返済した。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    },
    {
      account_title: "支払利息",
      amount: "8000",
      right_account_title: "",
      right_amount: "",
      tax_rate: "",
      description: "",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute23)

compound_journal_attribute24 = {
  accounting_date: '2021-02-21',
  compound_journals_attributes: [
    {
      account_title: "消耗品費",
      amount: "98000",
      right_account_title: "未払金",
      right_amount: "98000",
      tax_rate: "",
      description: "社長が必要な経理ソフト98,000円（税抜）をクレジットカードで支払った。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute24)

compound_journal_attribute25 = {
  accounting_date: '2021-04-21',
  compound_journals_attributes: [
    {
      account_title: "現金",
      amount: "100000",
      right_account_title: "前受金",
      right_amount: "100000",
      tax_rate: "",
      description: "商品500,000円の代金のうち、100,000円を手付金として現金で受け取った。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute25)

compound_journal_attribute26 = {
  accounting_date: '2021-03-21',
  compound_journals_attributes: [
    {
      account_title: "普通預金",
      amount: "100000",
      right_account_title: "仮受金",
      right_amount: "100000",
      tax_rate: "",
      description: "出張中の従業員から内容不明の100,000円が普通預金に入金があった。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute26)

compound_journal_attribute27 = {
  accounting_date: '2021-04-21',
  compound_journals_attributes: [
    {
      account_title: "賞与手当",
      amount: "2000000",
      right_account_title: "当座預金",
      right_amount: "1850000",
      tax_rate: "",
      description: "従業員に賞与2,000,000円を、預り金150,000円を控除して当座預金から支払った。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    },
    {
      account_title: "",
      amount: "",
      right_account_title: "預り金",
      right_amount: "150000",
      tax_rate: "",
      description: "",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute27)

compound_journal_attribute28 = {
  accounting_date: '2021-01-01',
  compound_journals_attributes: [
    {
      account_title: "普通預金",
      amount: "2000000",
      right_account_title: "短期借入金",
      right_amount: "2000000",
      tax_rate: "",
      description: "短期借入金2,000,000円の融資を銀行Aから普通預金に入金された。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute28)






# PL





compound_journal_attribute31 = {
  accounting_date: '2021-04-21',
  compound_journals_attributes: [
    {
      account_title: "現金",
      amount: "10800",
      right_account_title: "売上",
      right_amount: "10000",
      tax_rate: "",
      description: "商品を10,800円（税込）で販売し、その代金は現金でもらった。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    },
    {
      account_title: "",
      amount: "",
      right_account_title: "仮受消費税",
      right_amount: "800",
      tax_rate: "8",
      description: "",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute31)

compound_journal_attribute32 = {
  accounting_date: '2021-03-21',
  compound_journals_attributes: [
    {
      account_title: "現金",
      amount: "250",
      right_account_title: "雑収入",
      right_amount: "250",
      tax_rate: "",
      description: "古新聞を廃品回収に出し、現金250円を受け取った。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute32)

compound_journal_attribute33 = {
  accounting_date: '2021-02-21',
  compound_journals_attributes: [
    {
      account_title: "仕入",
      amount: "200000",
      right_account_title: "買掛金",
      right_amount: "216000",
      tax_rate: "",
      description: "商品216,000円（税込）を仕入れ代金は掛けとした。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    },
    {
      account_title: "仮払消費税",
      amount: "16000",
      right_account_title: "",
      right_amount: "",
      tax_rate: "8",
      description: "",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute33)

compound_journal_attribute34 = {
  accounting_date: '2021-01-21',
  compound_journals_attributes: [
    {
      account_title: "租税公課",
      amount: "130000",
      right_account_title: "現金",
      right_amount: "130000",
      tax_rate: "",
      description: "固定資産税130,000円を現金で支払った。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute34)

compound_journal_attribute35 = {
  accounting_date: '2021-02-21',
  compound_journals_attributes: [
    {
      account_title: "水道光熱費",
      amount: "6000",
      right_account_title: "普通預金",
      right_amount: "6480",
      tax_rate: "",
      description: "ガス代　6,480円（税込）が普通預金から引き落とされた。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    },
    {
      account_title: "仮払消費税",
      amount: "480",
      right_account_title: "",
      right_amount: "",
      tax_rate: "8",
      description: "",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute35)

compound_journal_attribute36 = {
  accounting_date: '2021-03-21',
  compound_journals_attributes: [
    {
      account_title: "旅費交通費",
      amount: "36500",
      right_account_title: "現金",
      right_amount: "36500",
      tax_rate: "",
      description: "飛行機で福岡まで36,500円現金で支払った。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute36)

compound_journal_attribute37 = {
  accounting_date: '2021-04-22',
  compound_journals_attributes: [
    {
      account_title: "通信費",
      amount: "40000",
      right_account_title: "普通預金",
      right_amount: "43200",
      tax_rate: "",
      description: "電話代43,200円（税込）が普通預金から引き落とされた。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    },
    {
      account_title: "仮払消費税",
      amount: "3200",
      right_account_title: "",
      right_amount: "",
      tax_rate: "8",
      description: "",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute37)


compound_journal_attribute39 = {
  accounting_date: '2021-05-04',
  compound_journals_attributes: [
    {
      account_title: "広告宣伝費",
      amount: "40000",
      right_account_title: "普通預金",
      right_amount: "43200",
      tax_rate: "",
      description: "毎月行なっているビラ作成43,200円（税込）の費用が普通預金から引き落とされた。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    },
    {
      account_title: "仮払消費税",
      amount: "3200",
      right_account_title: "",
      right_amount: "",
      tax_rate: "8",
      description: "",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute39)

compound_journal_attribute40 = {
  accounting_date: '2021-03-22',
  compound_journals_attributes: [
    {
      account_title: "支払保険料",
      amount: "35000",
      right_account_title: "現金",
      right_amount: "35000",
      tax_rate: "",
      description: "営業車の自賠責保険料35,000円を現金で支払った。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute40)

compound_journal_attribute41 = {
  accounting_date: '2021-03-22',
  compound_journals_attributes: [
    {
      account_title: "接待交際費",
      amount: "10000",
      right_account_title: "現金",
      right_amount: "10000",
      tax_rate: "",
      description: "仕入れ業者の社長が亡くなったので香典10,000円を渡した。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute41)

compound_journal_attribute42 = {
  accounting_date: '2021-03-22',
  compound_journals_attributes: [
    {
      account_title: "修繕費",
      amount: "20000",
      right_account_title: "現金",
      right_amount: "21600",
      tax_rate: "",
      description: "営業車が故障したので修理代21,600円（税込）を現金で支払った。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    },
    {
      account_title: "仮払消費税",
      amount: "1600",
      right_account_title: "",
      right_amount: "",
      tax_rate: "",
      description: "",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute42)

compound_journal_attribute43 = {
  accounting_date: '2021-03-22',
  compound_journals_attributes: [
    {
      account_title: "消耗品費",
      amount: "800",
      right_account_title: "現金",
      right_amount: "864",
      tax_rate: "",
      description: "蛍光灯864円（税込）が切れたので現金で支払った。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    },
    {
      account_title: "仮払消費税",
      amount: "64",
      right_account_title: "",
      right_amount: "",
      tax_rate: "",
      description: "",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute43)

compound_journal_attribute44 = {
  accounting_date: '2021-03-22',
  compound_journals_attributes: [
    {
      account_title: "福利厚生費",
      amount: "10000",
      right_account_title: "現金",
      right_amount: "10000",
      tax_rate: "",
      description: "従業員の子供が生まれたので出産祝い金として現金10,000円を支払った。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute44)

compound_journal_attribute45 = {
  accounting_date: '2021-03-22',
  compound_journals_attributes: [
    {
      account_title: "給料手当",
      amount: "2200000",
      right_account_title: "普通預金",
      right_amount: "1866000",
      tax_rate: "",
      description: "従業員に給料2,200,000円を支給。源泉所得税104,000円、住民税80,000円、社会保険料150,000円を控除して普通預金から振り込んだ。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    },
    {
      account_title: "",
      amount: "",
      right_account_title: "預り金",
      right_amount: "334000",
      tax_rate: "",
      description: "",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute45)

compound_journal_attribute46 = {
  accounting_date: '2021-03-22',
  compound_journals_attributes: [
    {
      account_title: "短期借入金",
      amount: "900",
      right_account_title: "普通預金",
      right_amount: "1000",
      tax_rate: "",
      description: "借入金900円の元金とその利息100円について普通預金から支払った。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    },
    {
      account_title: "利子割引料",
      amount: "100",
      right_account_title: "",
      right_amount: "",
      tax_rate: "",
      description: "",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute46)

compound_journal_attribute47 = {
  accounting_date: '2021-03-22',
  compound_journals_attributes: [
    {
      account_title: "地代家賃",
      amount: "500000",
      right_account_title: "普通預金",
      right_amount: "500000",
      tax_rate: "",
      description: "工場の家賃500,000円を普通預金から引き落とされた。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute47)

compound_journal_attribute48 = {
  accounting_date: '2021-03-22',
  compound_journals_attributes: [
    {
      account_title: "普通預金",
      amount: "59568",
      right_account_title: "売掛金",
      right_amount: "60000",
      tax_rate: "",
      description: "お客様から商品の売掛金60,000円が振り込まれたが、入金額は振込手数料432円(税込）が差し引かれていた。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    },
    {
      account_title: "支払手数料",
      amount: "400",
      right_account_title: "",
      right_amount: "",
      tax_rate: "",
      description: "",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    },
    {
      account_title: "仮払消費税",
      amount: "32",
      right_account_title: "",
      right_amount: "",
      tax_rate: "8",
      description: "",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute48)

compound_journal_attribute49 = {
  accounting_date: '2021-03-22',
  compound_journals_attributes: [
    {
      account_title: "貸倒損失",
      amount: "500000",
      right_account_title: "売掛金",
      right_amount: "500000",
      tax_rate: "",
      description: "お客様が倒産し売掛金500,000円が回収不能となった。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute49)

compound_journal_attribute50 = {
  accounting_date: '2021-03-22',
  compound_journals_attributes: [
    {
      account_title: "雑費",
      amount: "500",
      right_account_title: "現金",
      right_amount: "540",
      tax_rate: "",
      description: "ゴミ袋を540円（税込）で現金で購入した。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    },
    {
      account_title: "仮払消費税",
      amount: "40",
      right_account_title: "",
      right_amount: "",
      tax_rate: "8",
      description: "",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute50)


compound_journal_attribute52 = {
  accounting_date: '2021-02-22',
  compound_journals_attributes: [
    {
      account_title: "現金",
      amount: "10800",
      right_account_title: "売上",
      right_amount: "10000",
      tax_rate: "",
      description: "商品を10,800円（税込）で販売し、その代金は現金でもらった。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    },
    {
      account_title: "",
      amount: "",
      right_account_title: "仮受消費税",
      right_amount: "800",
      tax_rate: "8",
      description: "",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute52)

compound_journal_attribute53 = {
  accounting_date: '2021-02-22',
  compound_journals_attributes: [
    {
      account_title: "売上",
      amount: "300",
      right_account_title: "現金",
      right_amount: "300",
      tax_rate: "",
      description: "売り上げた商品について300円の割引をした。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute53)

compound_journal_attribute54 = {
  accounting_date: '2021-02-22',
  compound_journals_attributes: [
    {
      account_title: "売上",
      amount: "600",
      right_account_title: "現金",
      right_amount: "600",
      tax_rate: "",
      description: "600円の割戻しを行った。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute54)

compound_journal_attribute55 = {
  accounting_date: '2021-02-22',
  compound_journals_attributes: [
    {
      account_title: "売上",
      amount: "1000",
      right_account_title: "現金",
      right_amount: "1000",
      tax_rate: "",
      description: "売り上げた商品のうち1000円の返品を受けた。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute55)

compound_journal_attribute56 = {
  accounting_date: '2021-02-22',
  compound_journals_attributes: [
    {
      account_title: "売上",
      amount: "1000",
      right_account_title: "売掛金",
      right_amount: "1000",
      tax_rate: "",
      description: "売り上げた商品について1000円の値引をした。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute56)

compound_journal_attribute57 = {
  accounting_date: '2021-02-22',
  compound_journals_attributes: [
    {
      account_title: "売上割引",
      amount: "700",
      right_account_title: "売掛金",
      right_amount: "700",
      tax_rate: "",
      description: "B社が期限より早い支払いをしたため、700円の売上割引を行なった。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute57)

compound_journal_attribute58 = {
  accounting_date: '2021-01-01',
  compound_journals_attributes: [
    {
      account_title: "現金",
      amount: "10800000",
      right_account_title: "売上",
      right_amount: "10000000",
      tax_rate: "",
      description: "商品を10,800000円（税込）で販売し、その代金は現金でもらった。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    },
    {
      account_title: "",
      amount: "",
      right_account_title: "仮受消費税",
      right_amount: "800000",
      tax_rate: "8",
      description: "",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute58)

compound_journal_attribute59 = {
  accounting_date: '2021-02-01',
  compound_journals_attributes: [
    {
      account_title: "現金",
      amount: "10800000",
      right_account_title: "売上",
      right_amount: "10000000",
      tax_rate: "",
      description: "商品を10,800000円（税込）で販売し、その代金は現金でもらった。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    },
    {
      account_title: "",
      amount: "",
      right_account_title: "仮受消費税",
      right_amount: "800000",
      tax_rate: "8",
      description: "",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute59)

compound_journal_attribute60 = {
  accounting_date: '2021-03-01',
  compound_journals_attributes: [
    {
      account_title: "現金",
      amount: "10800000",
      right_account_title: "売上",
      right_amount: "10000000",
      tax_rate: "",
      description: "商品を10,800000円（税込）で販売し、その代金は現金でもらった。",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    },
    {
      account_title: "",
      amount: "",
      right_account_title: "仮受消費税",
      right_amount: "800000",
      tax_rate: "8",
      description: "",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute60)

compound_journal_attribute61 = {
  accounting_date: '2021-02-22',
  compound_journals_attributes: [
    {
      account_title: "期首商品棚卸高",
      amount: "30000000",
      right_account_title: "商品",
      right_amount: "30000000",
      tax_rate: "",
      description: "",
      sub_account_title: "",
      right_tax_rate: "",
      right_sub_account_title: ""
    }
  ]
}
Account.create!(compound_journal_attribute61)