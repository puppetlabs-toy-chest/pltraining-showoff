require "spec_helper"

describe "showoff::params" do
  let(:node) { 'test.example.com' }

  context "RedHat" do
    let(:facts) { {
      :os => {
        :family => 'RedHat',
        :release => {
          :major => '7',
          :minor => '2',
        }
      },
    } }
  it { is_expected.to compile.with_all_deps }
  end

  context "Non-RedHat" do
    let(:facts) { {
      :os => {
        :family => 'Debian',
        :release => {
          :major => '8',
          :minor => '6',
        }
      },
    } }
  it { is_expected.to raise_error(Puppet::Error) }
  end

end
