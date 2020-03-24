# Preview all emails at http://localhost:3000/rails/mailers/claim_deadline_mailer
class ClaimDeadlineMailerPreview < ActionMailer::Preview
    def claim_24hr_deadine
        ClaimDeadlineMailer.claim_24hr_deadine(Claim.first.id)
    end
end
