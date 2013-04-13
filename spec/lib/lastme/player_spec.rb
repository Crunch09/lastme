require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require 'lastme'
require 'json'

module Lastme

  describe Player do

    before(:all){
      system 'mpc -q add Best\ Coast\ -\ The\ Only\ Place.mp3'
    }

    after(:all){
      system 'mpd spec/mpd/mpd.conf --kill'
    }

    it 'plays the current song' do
      system 'mpc -q pause'
      subject.play
      subject.should be_running
    end

    it 'pauses the current song' do
      system 'mpc -q play'
      subject.pause
      subject.should_not be_running
    end

    context 'there is a next song' do
      it 'skips to the next song' do
        system 'mpc -q add Cloud\ Nothings\ -\ Stay\ Useless.mp3'
        subject.current_song.should eq "Best Coast - The Only Place"
        subject.next
        subject.current_song.should eq "Cloud Nothings - Stay Useless"
      end
    end
  end

end
