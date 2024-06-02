class Spotvm < Formula
    desc "spot vm tool"
    homepage "https://github.com/lanytcc/spot"
    version "0.0.2"
    if OS.mac?
      if Hardware::CPU.arm?
        url "https://github.com/lanytcc/spot/releases/download/v#{version}/spot_darwin_arm64"
        sha256 "1f68564e7169d6c30b3679609ebe9337ec942b5b8ce856e7c5b8e545219be859"
      else
        url "https://github.com/lanytcc/spot/releases/download/v#{version}/spot_darwin_amd64"
        sha256 "d3efb41dbb5165942553e1424cfe46df9dbd20a709294276eeba9ec8eee58446"
      end
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/lanytcc/spot/releases/download/v#{version}/spot_linux_amd64"
        sha256 "03e882a5e316958dc84ba966027d01af0d23e19176022ed2701d365074a2ece1"
      end
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/lanytcc/spot/releases/download/v#{version}/spot_linux_arm64"
        sha256 "55670ea9c5e747004c85bb35c665417d41be3db540778b0cf5cb92caabbf4e93"
      end
    end
    def install
      if OS.mac?
        if Hardware::CPU.intel?
          bin.install "spot_darwin_amd64" => "spotvm"
        else
          bin.install "spot_darwin_arm64" => "spotvm"
        end
      elsif OS.linux?
        if Hardware::CPU.intel?
          bin.install "spot_linux_amd64" => "spotvm"
        else
          bin.install "spot_linux_arm64" => "spotvm"
        end
      end
    end
    test do
      assert_match "spotvm vervion v#{version}", shell_output("#{bin}/spotvm -v")
    end
end
