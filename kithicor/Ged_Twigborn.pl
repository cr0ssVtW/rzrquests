sub EVENT_SAY {
  if ($text=~/hail/i) {#need correct text
    quest::say("Hello Traveler.  Don't mind me, I'm just working on some [clothes]");
  }
  if ($text=~/clothes/i) {
    quest::say("Well, more like [gloves] actually, they are my specialty.");
  }
  if ($text=~/gloves/i) {
    quest::say("Aye, gloves.  I would be happy to make you a pair if you can bring me a lion skin and 96 gold pieces.  I also make them from [bear] skin, [wolf] skin, or [rat] skin.");
  }
  if ($text=~/bear/i) {
    quest::say("If you would like gloves from bear skin I require a bear hide and 25 gold pieces.");
  }
  if ($text=~/rat/i) {
    quest::say("Always did make fine rat gloves. I will need 6 gold, and a giant rat pelt.");
  }
  if ($text=~/wolf/i) {
    quest::say("I will require 13 gold pieces and a wolf pelt.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13766 => 1, $gold >= 96)) {
    quest::summonitem(2315);
  }
  if (plugin::check_handin(\%itemcount, 13752 => 1, $gold >= 25)) {
    quest::summonitem(2314);
  }
  if (plugin::check_handin(\%itemcount, 13054 => 1, $gold >=6)) {
    $whichgloves = int(rand(100));
    if ($whichgloves > 75) {
      quest::emote("Ged takes a few minutes and produces a fine pair of gloves.");
      quest::say("Now that is a nice pelt. Here, I made this for you.");
      quest::summonitem(132491); # RZR item
    } else {
      quest::emote("Ged takes a few minutes and produces a shabby pair of gloves.");
      quest::say("What a shabby looking pelt. I botched the craft this time, but here you go.");
      quest::summonitem(2312);
    }
  }
  if (plugin::check_handin(\%itemcount, 13755 => 1, $gold >=13)) {
    quest::summonitem(2313);
  }
}
