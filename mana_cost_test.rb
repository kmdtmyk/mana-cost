require 'test/unit'
require_relative 'mana_cost'

class ManaCostTest < Test::Unit::TestCase

  sub_test_case 'convert' do

    test 'empty' do
      assert_equal(0, ManaCost.convert(''))
    end

    test 'Single Symbol' do
      assert_equal(1, ManaCost.convert('(白)'))
      assert_equal(1, ManaCost.convert('(青)'))
      assert_equal(1, ManaCost.convert('(黒)'))
      assert_equal(1, ManaCost.convert('(赤)'))
      assert_equal(1, ManaCost.convert('(緑)'))
      assert_equal(1, ManaCost.convert('(◇)'))
    end

    test 'Generic Mana' do
      assert_equal(0, ManaCost.convert('(0)'))
      assert_equal(1, ManaCost.convert('(1)'))
      assert_equal(2, ManaCost.convert('(2)'))
      assert_equal(3, ManaCost.convert('(3)'))
      assert_equal(10, ManaCost.convert('(10)'))
      assert_equal(15, ManaCost.convert('(15)'))
    end

    test 'Hybrid Mana Symbol' do
      assert_equal(1, ManaCost.convert('(白/青)'))
      assert_equal(1, ManaCost.convert('(青/黒)'))
      assert_equal(1, ManaCost.convert('(黒/赤)'))
      assert_equal(1, ManaCost.convert('(赤/緑)'))
      assert_equal(1, ManaCost.convert('(緑/白)'))
      assert_equal(1, ManaCost.convert('(白/黒)'))
      assert_equal(1, ManaCost.convert('(青/赤)'))
      assert_equal(1, ManaCost.convert('(黒/緑)'))
      assert_equal(1, ManaCost.convert('(赤/白)'))
      assert_equal(1, ManaCost.convert('(緑/青)'))
    end

    test 'Hybrid Mana Symbol 2' do
      assert_equal(2, ManaCost.convert('(2/白)'))
      assert_equal(2, ManaCost.convert('(2/青)'))
      assert_equal(2, ManaCost.convert('(2/黒)'))
      assert_equal(2, ManaCost.convert('(2/赤)'))
      assert_equal(2, ManaCost.convert('(2/緑)'))
    end

    test 'Phyrexian Mana' do
      assert_equal(1, ManaCost.convert('(白/Φ)'))
      assert_equal(1, ManaCost.convert('(青/Φ)'))
      assert_equal(1, ManaCost.convert('(黒/Φ)'))
      assert_equal(1, ManaCost.convert('(赤/Φ)'))
      assert_equal(1, ManaCost.convert('(緑/Φ)'))
    end

    test 'Double Symbol' do
      assert_equal(2, ManaCost.convert('(白)(白)'))
      assert_equal(2, ManaCost.convert('(青)(青)'))
      assert_equal(2, ManaCost.convert('(黒)(黒)'))
      assert_equal(2, ManaCost.convert('(赤)(赤)'))
      assert_equal(2, ManaCost.convert('(緑)(緑)'))
    end

    test 'Multicolored' do
      assert_equal(2, ManaCost.convert('(白)(青)'))
      assert_equal(2, ManaCost.convert('(青)(黒)'))
      assert_equal(2, ManaCost.convert('(黒)(赤)'))
      assert_equal(2, ManaCost.convert('(赤)(緑)'))
      assert_equal(2, ManaCost.convert('(緑)(白)'))
      assert_equal(2, ManaCost.convert('(白)(黒)'))
      assert_equal(2, ManaCost.convert('(青)(赤)'))
      assert_equal(2, ManaCost.convert('(黒)(緑)'))
      assert_equal(2, ManaCost.convert('(赤)(白)'))
      assert_equal(2, ManaCost.convert('(緑)(青)'))
    end

    test 'X Mana' do
      assert_equal(0, ManaCost.convert('(X)'))
      assert_equal(0, ManaCost.convert('(X)(X)'))
      assert_equal(0, ManaCost.convert('(X)(X)(X)'))
    end

  end

end
