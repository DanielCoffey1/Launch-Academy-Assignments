require 'spec_helper'

describe User do
  it { should have_many(:groups) }
  it { should have_many(:projects).through(:groups) }
  it { should have_many(:tasks).through(:projects) }

  it { should have_valid(:first_name).when("Johnny") }
  it { should_not have_valid(:first_name).when(nil, "") }

  it { should have_valid(:last_name).when("Smith") }
  it { should_not have_valid(:last_name).when(nil, "") }
end

describe Project do
  it { should have_many(:tasks) }
  it { should have_many(:groups) }
  it { should have_many(:users).through(:groups) }

  it { should have_valid(:name).when("Assignment") }
  it { should_not have_valid(:name).when(nil, "") }
end

describe Group do
  it { should belong_to :user }
  it { should belong_to :project }

  it { should have_valid(:user_id).when("User") }
  it { should_not have_valid(:user_id).when(nil, "") }

  it { should have_valid(:project_id).when("Project") }
  it { should_not have_valid(:project_id).when(nil, "") }
end

describe Task do
  it { should belong_to :project }

  it { should have_valid(:name).when("Duty") }
  it { should_not have_valid(:name).when(nil, "") }
end
