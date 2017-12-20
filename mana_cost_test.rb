require 'test/unit'
require_relative 'mana_cost'

class ManaCostTest < Test::Unit::TestCase

  sub_test_case 'convert' do

    test 'empty' do
      assert_true(ManaCost.convert('') == 0)
    end

    test 'Single Symbol' do
      assert_true(ManaCost.convert('(白)') == 1)
      assert_true(ManaCost.convert('(青)') == 1)
      assert_true(ManaCost.convert('(黒)') == 1)
      assert_true(ManaCost.convert('(赤)') == 1)
      assert_true(ManaCost.convert('(緑)') == 1)
      assert_true(ManaCost.convert('(◇)') == 1)
    end

    test 'Generic Mana' do
      assert_true(ManaCost.convert('(0)') == 0)
      assert_true(ManaCost.convert('(1)') == 1)
      assert_true(ManaCost.convert('(2)') == 2)
      assert_true(ManaCost.convert('(3)') == 3)
      assert_true(ManaCost.convert('(10)') == 10)
      assert_true(ManaCost.convert('(15)') == 15)
    end

    test 'Hybrid Mana Symbol' do
      assert_true(ManaCost.convert('(白/青)') == 1)
      assert_true(ManaCost.convert('(青/黒)') == 1)
      assert_true(ManaCost.convert('(黒/赤)') == 1)
      assert_true(ManaCost.convert('(赤/緑)') == 1)
      assert_true(ManaCost.convert('(緑/白)') == 1)
      assert_true(ManaCost.convert('(白/黒)') == 1)
      assert_true(ManaCost.convert('(青/赤)') == 1)
      assert_true(ManaCost.convert('(黒/緑)') == 1)
      assert_true(ManaCost.convert('(赤/白)') == 1)
      assert_true(ManaCost.convert('(緑/青)') == 1)
    end

    test 'Hybrid Mana Symbol 2' do
      assert_true(ManaCost.convert('(2/白)') == 2)
      assert_true(ManaCost.convert('(2/青)') == 2)
      assert_true(ManaCost.convert('(2/黒)') == 2)
      assert_true(ManaCost.convert('(2/赤)') == 2)
      assert_true(ManaCost.convert('(2/緑)') == 2)
    end

    test 'Phyrexian Mana' do
      assert_true(ManaCost.convert('(白/Φ)') == 1)
      assert_true(ManaCost.convert('(青/Φ)') == 1)
      assert_true(ManaCost.convert('(黒/Φ)') == 1)
      assert_true(ManaCost.convert('(赤/Φ)') == 1)
      assert_true(ManaCost.convert('(緑/Φ)') == 1)
    end

    test 'Double Symbol' do
      assert_true(ManaCost.convert('(白)(白)') == 2)
      assert_true(ManaCost.convert('(青)(青)') == 2)
      assert_true(ManaCost.convert('(黒)(黒)') == 2)
      assert_true(ManaCost.convert('(赤)(赤)') == 2)
      assert_true(ManaCost.convert('(緑)(緑)') == 2)
    end

    test 'Multicolored' do
      assert_true(ManaCost.convert('(白)(青)') == 2)
      assert_true(ManaCost.convert('(青)(黒)') == 2)
      assert_true(ManaCost.convert('(黒)(赤)') == 2)
      assert_true(ManaCost.convert('(赤)(緑)') == 2)
      assert_true(ManaCost.convert('(緑)(白)') == 2)
      assert_true(ManaCost.convert('(白)(黒)') == 2)
      assert_true(ManaCost.convert('(青)(赤)') == 2)
      assert_true(ManaCost.convert('(黒)(緑)') == 2)
      assert_true(ManaCost.convert('(赤)(白)') == 2)
      assert_true(ManaCost.convert('(緑)(青)') == 2)
    end

  end

end
