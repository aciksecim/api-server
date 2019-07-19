using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AcikSecim.WebApi.Models;
using AcikSecim.WebApi.Models.Errors;

namespace AcikSecim.WebApi.Services.Candidate
{
    public class CandidateService : ICandidate
    {
        private AcikSecimDBContext _apiDbContext;

        public CandidateService(AcikSecimDBContext apiDbContext)
        {
            _apiDbContext = apiDbContext;
        }

        public async Task<List<Adaylar>> GetCandidates()
        {
            try
            {
                List<Adaylar> candidateList = _apiDbContext.Adaylar.ToList();
                return candidateList;
            }
            catch (Exception ex)
            {
                throw new UserFriendlyExceptions("400", $"{ex.Message}", ex.StackTrace);
            }
        }
    }
}
