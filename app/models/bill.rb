class Bill < ActiveRecord::Base

	belongs_to :creator,
		class_name: "User"

	has_many :bill_participations, dependent: :destroy

	has_many :debtors,
		through: :bill_participations,
		source: :user

	has_many :comments, as: :commentable

	validates_presence_of :name, :description, :creator_id, :cost

	def cost_f
		"$#{self.cost.to_f.round(2)}"
	end

	def set_iou(user_id)
		user_bill = get_bill_participation(user_id)
		debtors = self.bill_participations.length
		user_bill.iou = self.cost / debtors
		user_bill.save!
	end

	def get_bill_participation(user_id)
		BillParticipation.where(bill_id: self.id, user_id: user_id)
	end

	def get_iou(user_id)
		bill = get_bill_participation(user_id)
		bill.first.iou
	end

	def happen_at
		rand_date
	end

	def rand_date
	  # return a random date within 100 days of today in both past and future directions.
	  n = rand(-8..18)
	  Date.today.advance(days: n)
	end
end
