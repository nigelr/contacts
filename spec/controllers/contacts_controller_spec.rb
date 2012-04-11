require 'spec_helper'

describe ContactsController do
  let(:contact) { FactoryGirl.create(:contact)}

  before do
    sign_in contact
  end

  describe "GET index" do
    it "assigns all contacts as @contacts" do
      get :index
      assigns(:contacts).should eq([contact])
    end
  end

  describe "GET show" do
    it "assigns the requested contact as @contact" do
      get :show, {:id => contact.to_param}
      assigns(:contact).should eq(contact)
    end
  end

  describe "GET new" do
    it "assigns a new contact as @contact" do
      get :new
      assigns(:contact).should be_a_new(Contact)
    end
  end

  describe "GET edit" do
    it "assigns the requested contact as @contact" do
      get :edit, {:id => contact.to_param}
      assigns(:contact).should eq(contact)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      before do
        Contact.any_instance.stub(:valid?).and_return(true)
        post :create
      end
      it { assigns(:contact).should be_persisted }
      it { should assign_to(:contact).with_kind_of(Contact) }
      it { should redirect_to(contact_path(assigns(:contact))) }
      it { should set_the_flash.to(/created/i) }
    end

    describe "with invalid params" do
      before do
        Contact.any_instance.stub(:valid?).and_return(false)
        post :create
      end
      it { assigns(:contact).should_not be_persisted }
      it { should assign_to(:contact).with_kind_of(Contact) }
      it { should render_template("new") }
      it { should_not set_the_flash.to(/created/i) }
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      before do
        Contact.any_instance.stub(:valid?).and_return(true)
        put :update, id: contact
      end
      it { should assign_to(:contact).with(contact) }
      it { should redirect_to(contact_path(assigns(:contact))) }
      it { should set_the_flash.to(/updated/i) }
    end

    describe "with invalid params" do
      before do
        Contact.any_instance.stub(:valid?).and_return(false)
        put :update, id: contact
      end
      it { should assign_to(:contact).with(contact) }
      it { should render_template("edit") }
      it { should_not set_the_flash.to(/updated/i) }
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested contact" do
      expect {
        delete :destroy, {:id => contact.to_param}
      }.to change(Contact, :count).by(-1)
    end

    it "redirects to the contacts list" do
      delete :destroy, {:id => contact.to_param}
      response.should redirect_to(contacts_url)
    end
  end
end
