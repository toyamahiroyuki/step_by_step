require 'spec_helper'

describe OrmAdapter do
  subject { OrmAdapter }

  describe "when a new adapter is created (by inheriting form OrmAdapter::Base)" do
    let!(:adapter) { Class.new(OrmAdapter::Base) }

    after { OrmAdapter.adapters.delete(adapter) }

    its(:adapters) { should include(adapter) }
  end
end
