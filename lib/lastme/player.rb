module Lastme
  class Player

    def play
      system 'mpc -q play'
    end

    def pause
      system 'mpc -q pause'
    end

    def next
      system 'mpc -q next'
    end

    def running?
      status = `mpc status | awk 'NR==2 {print $1}'`.delete("\n")
      status == "[playing]"
    end

    def current_song
      name = `mpc current`.delete("\n")
      name
    end
  end
end
