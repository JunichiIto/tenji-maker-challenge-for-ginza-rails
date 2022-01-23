require 'minitest/autorun'
require_relative '../lib/tenji_maker'

class TenjiMakerTest < Minitest::Test
  # ここから下のテストは変更不可 =====================
  def setup
    @tenji_maker = TenjiMaker.new
  end

  def test_a_hi_ru
    tenji = @tenji_maker.to_tenji('A HI RU')
    assert_equal <<~TENJI.chomp, tenji
      o- o- oo
      -- o- -o
      -- oo --
    TENJI
  end

  def test_ki_ri_n
    tenji = @tenji_maker.to_tenji('KI RI N')
    assert_equal <<~TENJI.chomp, tenji
      o- o- --
      o- oo -o
      -o -- oo
    TENJI
  end

  def test_si_ma_u_ma
    tenji = @tenji_maker.to_tenji('SI MA U MA')
    assert_equal <<~TENJI.chomp, tenji
      o- o- oo o-
      oo -o -- -o
      -o oo -- oo
    TENJI
  end

  def test_ni_wa_to_ri
    tenji = @tenji_maker.to_tenji('NI WA TO RI')
    assert_equal <<~TENJI.chomp, tenji
      o- -- -o o-
      o- -- oo oo
      o- o- o- --
    TENJI
  end

  def test_hi_yo_ko
    tenji = @tenji_maker.to_tenji('HI YO KO')
    assert_equal <<~TENJI.chomp, tenji
      o- -o -o
      o- -o o-
      oo o- -o
    TENJI
  end

  def test_ki_tu_ne
    tenji = @tenji_maker.to_tenji('KI TU NE')
    assert_equal <<~TENJI.chomp, tenji
      o- oo oo
      o- -o o-
      -o o- o-
    TENJI
  end
  # ここから上のテストは変更不可 =====================

  # 独自のテストパターンを追加するのは自由です
  def test_iroha1
    tenji = @tenji_maker.to_tenji('I RO HA NI HO HE TO TI RI NU RU')
    assert_equal <<~TENJI.chomp, tenji
      o- -o o- o- -o oo -o o- o- oo oo
      o- oo -- o- o- o- oo oo oo -- -o
      -- -- oo o- oo oo o- o- -- o- --
    TENJI
  end

  def test_iroha2
    tenji = @tenji_maker.to_tenji('WA KA YO TA RE SO TU NE NA RA MU')
    assert_equal <<~TENJI.chomp, tenji
      -- o- -o o- oo -o oo oo o- o- oo
      -- -- -o -o oo oo -o o- -- -o -o
      o- -o o- o- -- -o o- o- o- -- oo
    TENJI
  end

  def test_iroha3
    tenji = @tenji_maker.to_tenji('U NO O KU YA MA KE HU KO E TE')
    assert_equal <<~TENJI.chomp, tenji
      oo -o -o oo -o o- oo oo -o oo oo
      -- o- o- -- -- -o o- -- o- o- oo
      -- o- -- -o o- oo -o oo -o -- o-
    TENJI
  end

  def test_iroha4
    tenji = @tenji_maker.to_tenji('A SA KI YU ME MI SI HI MO SE SU N')
    assert_equal <<~TENJI.chomp, tenji
      o- o- o- -o oo o- o- o- -o oo oo --
      -- -o o- -- oo oo oo o- oo oo -o -o
      -- -o -o oo oo oo -o oo oo -o -o oo
    TENJI
  end
end
