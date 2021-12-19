require 'minitest/autorun'
require_relative '../lib/tenji_maker'

class TenjiMakerTest < Minitest::Test
  def setup
    @tenji_maker = TenjiMaker.new
  end

  # アヒル
  def test_a_hi_ru
    tenji = @tenji_maker.to_tenji('A HI RU')
    assert_equal <<~TENJI.chomp, tenji
      o- o- oo
      -- o- -o
      -- oo --
    TENJI
  end

  # キリン
  def test_ki_ri_n
    tenji = @tenji_maker.to_tenji('KI RI N')
    assert_equal <<~TENJI.chomp, tenji
      o- o- --
      o- oo -o
      -o -- oo
    TENJI
  end

  # シマウマ
  def test_si_ma_u_ma
    tenji = @tenji_maker.to_tenji('SI MA U MA')
    assert_equal <<~TENJI.chomp, tenji
      o- o- oo o-
      oo -o -- -o
      -o oo -- oo
    TENJI
  end

  # ニワトリ
  def test_ni_wa_to_ri
    tenji = @tenji_maker.to_tenji('NI WA TO RI')
    assert_equal <<~TENJI.chomp, tenji
      o- -- -o o-
      o- -- oo oo
      o- o- o- --
    TENJI
  end

  # ヒヨコ
  def test_hi_yo_ko
    tenji = @tenji_maker.to_tenji('HI YO KO')
    assert_equal <<~TENJI.chomp, tenji
      o- -o -o
      o- -o o-
      oo o- -o
    TENJI
  end

  # キツネ
  def test_ki_tu_ne
    tenji = @tenji_maker.to_tenji('KI TU NE')
    assert_equal <<~TENJI.chomp, tenji
      o- oo oo
      o- -o o-
      -o o- o-
    TENJI
  end

  # チーター
  def test_tii_taa
    tenji = @tenji_maker.to_tenji('TI - TA -')
    assert_equal <<~TENJI.chomp, tenji
      o- -- o- --
      oo oo -o oo
      o- -- o- --
    TENJI
  end

  # ゴリラ
  def test_go_ri_ra
    tenji = @tenji_maker.to_tenji('GO RI RA')
    assert_equal <<~TENJI.chomp, tenji
      -- -o o- o-
      -o o- oo -o
      -- -o -- --
    TENJI
  end

  # ネズミ
  def test_ne_zu_mi
    tenji = @tenji_maker.to_tenji('NE ZU MI')
    assert_equal <<~TENJI.chomp, tenji
      oo -- oo o-
      o- -o -o oo
      o- -- -o oo
    TENJI
  end

  # カバ
  def test_ka_ba
    tenji = @tenji_maker.to_tenji('KA BA')
    assert_equal <<~TENJI.chomp, tenji
      o- -- o-
      -- -o --
      -o -- oo
    TENJI
  end

  # パンダ
  def test_pa_n_da
    tenji = @tenji_maker.to_tenji('PA N DA')
    assert_equal <<~TENJI.chomp, tenji
      -- o- -- -- o-
      -- -- -o -o -o
      -o oo oo -- o-
    TENJI
  end

  # シャチ
  def test_sya_ti
    tenji = @tenji_maker.to_tenji('SYA TI')
    assert_equal <<~TENJI.chomp, tenji
      -o o- o-
      -- -o oo
      -- -o o-
    TENJI
  end

  # ニャンちゅう（ニャンチュウ）
  def test_nya_n_tyu
    tenji = @tenji_maker.to_tenji('NYA N TYU')
    assert_equal <<~TENJI.chomp, tenji
      -o o- -- -o oo
      -- -- -o -- -o
      -- o- oo -- o-
    TENJI
  end

  # クロヒョウ
  def test_ku_ro_hyo
    tenji = @tenji_maker.to_tenji('KU RO HYO')
    assert_equal <<~TENJI.chomp, tenji
      oo -o -o -o
      -- oo -- o-
      -o -- -- oo
    TENJI
  end

  # エミュー
  def test_e_myuu
    tenji = @tenji_maker.to_tenji('E MYU -')
    assert_equal <<~TENJI.chomp, tenji
      oo -o oo --
      o- -- -o oo
      -- -- oo --
    TENJI
  end

  # リャマ
  def test_rya_ma
    tenji = @tenji_maker.to_tenji('RYA MA')
    assert_equal <<~TENJI.chomp, tenji
      -o o- o-
      -- -o -o
      -- -- oo
    TENJI
  end

  # キンギョ
  def test_ki_n_gyo
    tenji = @tenji_maker.to_tenji('KI N GYO')
    assert_equal <<~TENJI.chomp, tenji
      o- -- -o -o
      o- -o -o o-
      -o oo -- -o
    TENJI
  end

  # クジャク
  def test_ku_zya_ku
    tenji = @tenji_maker.to_tenji('KU ZYA KU')
    assert_equal <<~TENJI.chomp, tenji
      oo -o o- oo
      -- -o -o --
      -o -- -o -o
    TENJI
  end

  # クヂャク（クジャク）
  def test_ku_dya_ku
    tenji = @tenji_maker.to_tenji('KU DYA KU')
    assert_equal <<~TENJI.chomp, tenji
      oo -o o- oo
      -- -o -o --
      -o -- o- -o
    TENJI
  end

  # ピョン吉（ピョンキチ）
  def test_pyo_n_ki_ti
    tenji = @tenji_maker.to_tenji('PYO N KI TI')
    assert_equal <<~TENJI.chomp, tenji
      -o -o -- o- o-
      -- o- -o o- oo
      -o oo oo -o o-
    TENJI
  end

  # 白虎（ビャッコ）
  def test_bya_kko
    tenji = @tenji_maker.to_tenji('BYA KKO')
    assert_equal <<~TENJI.chomp, tenji
      -o o- -- -o
      -o -- o- o-
      -- oo -- -o
    TENJI
  end

  # ウォンバット（ヲンバット）
  def test_wo_n_ba_tto
    tenji = @tenji_maker.to_tenji('WO N BA TTO')
    assert_equal <<~TENJI.chomp, tenji
      -- -- -- o- -- -o
      -o -o -o -- o- oo
      o- oo -- oo -- o-
    TENJI
  end

  # 吉四六さん（キッチョムサン）
  def test_ki_ttyo_mu_sa_n
    tenji = @tenji_maker.to_tenji('KI TTYO MU SA N')
    assert_equal <<~TENJI.chomp, tenji
      o- -- -o -o oo o- --
      o- o- -- oo -o -o -o
      -o -- -- o- oo -o oo
    TENJI
  end
end
