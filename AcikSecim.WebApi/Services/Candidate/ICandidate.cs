using AcikSecim.WebApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AcikSecim.WebApi.Services.Candidate
{
    public interface ICandidate
    {
        // <summary>
        /// Get candidate list
        /// </summary>
        /// <param ></param>
        /// <returns>Candidate List</returns>
        Task<List<Adaylar>> GetCandidates();

        
    }
}
