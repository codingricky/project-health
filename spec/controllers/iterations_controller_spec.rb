require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe IterationsController do

  # This should return the minimal set of attributes required to create a valid
  # Iteration. As you add validations to Iteration, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # IterationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all iterations as @iterations" do
      iteration = Iteration.create! valid_attributes
      get :index, {}, valid_session
      assigns(:iterations).should eq([iteration])
    end
  end

  describe "GET show" do
    it "assigns the requested iteration as @iteration" do
      iteration = Iteration.create! valid_attributes
      get :show, {:id => iteration.to_param}, valid_session
      assigns(:iteration).should eq(iteration)
    end
  end

  describe "GET new" do
    it "assigns a new iteration as @iteration" do
      get :new, {}, valid_session
      assigns(:iteration).should be_a_new(Iteration)
    end
  end

  describe "GET edit" do
    it "assigns the requested iteration as @iteration" do
      iteration = Iteration.create! valid_attributes
      get :edit, {:id => iteration.to_param}, valid_session
      assigns(:iteration).should eq(iteration)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Iteration" do
        expect {
          post :create, {:iteration => valid_attributes}, valid_session
        }.to change(Iteration, :count).by(1)
      end

      it "assigns a newly created iteration as @iteration" do
        post :create, {:iteration => valid_attributes}, valid_session
        assigns(:iteration).should be_a(Iteration)
        assigns(:iteration).should be_persisted
      end

      it "redirects to the created iteration" do
        post :create, {:iteration => valid_attributes}, valid_session
        response.should redirect_to(Iteration.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved iteration as @iteration" do
        # Trigger the behavior that occurs when invalid params are submitted
        Iteration.any_instance.stub(:save).and_return(false)
        post :create, {:iteration => { "name" => "invalid value" }}, valid_session
        assigns(:iteration).should be_a_new(Iteration)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Iteration.any_instance.stub(:save).and_return(false)
        post :create, {:iteration => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested iteration" do
        iteration = Iteration.create! valid_attributes
        # Assuming there are no other iterations in the database, this
        # specifies that the Iteration created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Iteration.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => iteration.to_param, :iteration => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested iteration as @iteration" do
        iteration = Iteration.create! valid_attributes
        put :update, {:id => iteration.to_param, :iteration => valid_attributes}, valid_session
        assigns(:iteration).should eq(iteration)
      end

      it "redirects to the iteration" do
        iteration = Iteration.create! valid_attributes
        put :update, {:id => iteration.to_param, :iteration => valid_attributes}, valid_session
        response.should redirect_to(iteration)
      end
    end

    describe "with invalid params" do
      it "assigns the iteration as @iteration" do
        iteration = Iteration.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Iteration.any_instance.stub(:save).and_return(false)
        put :update, {:id => iteration.to_param, :iteration => { "name" => "invalid value" }}, valid_session
        assigns(:iteration).should eq(iteration)
      end

      it "re-renders the 'edit' template" do
        iteration = Iteration.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Iteration.any_instance.stub(:save).and_return(false)
        put :update, {:id => iteration.to_param, :iteration => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested iteration" do
      iteration = Iteration.create! valid_attributes
      expect {
        delete :destroy, {:id => iteration.to_param}, valid_session
      }.to change(Iteration, :count).by(-1)
    end

    it "redirects to the iterations list" do
      iteration = Iteration.create! valid_attributes
      delete :destroy, {:id => iteration.to_param}, valid_session
      response.should redirect_to(iterations_url)
    end
  end

end
