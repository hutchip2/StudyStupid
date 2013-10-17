class DecksController < ApplicationController

  def list
    @decks = Deck.find(:all)
  end

  def show
    @deck = Deck.find(params[:id])
  end

  def new
    @deck = Deck.new
    #@subjects = Subject.find(:all)
  end

  def create
    @deck = Deck.new(params[:deck])
    if @deck.save
      redirect_to :action => 'list'
    else
      #@subjects = Subject.find(:all)
      render :action => 'new'
    end
  end

  def edit
    @deck = Deck.find(params[:id])
    #@subjects = Subject.find(:all)
  end

  def update
    @deck = Deck.find(params[:id])
    if @deck.update_attributes(params[:deck])
      redirect_to :action => 'show', :id => @deck
    else
      #@subjects = Subject.find(:all)
      render :action => 'edit'
    end
  end

  def destroy
    Deck.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

end
