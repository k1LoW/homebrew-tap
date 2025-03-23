class OctocovRunnCoverage < Formula
  desc 'Generate octocov custom metrics JSON from the output of 'runn coverage'.'
  version '0.1.0'
  homepage 'https://github.com/k1LoW/octocov-runn-coverage'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.0/octocov-runn-coverage_v0.1.0_darwin_arm64.zip'
      sha256 'c8e29e63b438e23a8c9861f1e8ccd9e9e296d89240da2994bcb176ee27f8d4c6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.0/octocov-runn-coverage_v0.1.0_darwin_amd64.zip'
      sha256 '76d084c571fe1506d8389aa1a9fa1078ac8f07c5e6ceefa41f0d488ea4884b9a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.0/octocov-runn-coverage_v0.1.0_linux_arm64.tar.gz'
      sha256 '503c129ddd69166db2944d5f0afc689001ec7379e40ee3d6543caa8970dba399'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.0/octocov-runn-coverage_v0.1.0_linux_amd64.tar.gz'
      sha256 'a16a882257ac3e305a2f3af9c50cb0976c7ee00774afd5b8950ba62edaada441'
    end
  end

  head do
    url 'https://github.com/k1LoW/octocov-runn-coverage.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'octocov-runn-coverage'
  end
end
