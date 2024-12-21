cdlass Suica
\
  attr_reader :money

  def initialize(money = 500)
    @money = money
  end

  #  チャージ金額の減少
  def deduct_money(amount)
    if @money > amount
      @money -= amount
    else
      'チャージ金額が足りません'
    end
  end

  #  suicaのチャージ
  def charge(charged)
    raise "100円未満はチャージできません。 チャージ金額は#{charged}円です。" unless charged >= 100

    @money += charged
  end

  private

  # セッターメソッド
  attr_writer :money
end
