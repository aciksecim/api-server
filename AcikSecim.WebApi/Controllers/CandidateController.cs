using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AcikSecim.WebApi.Models;
using AcikSecim.WebApi.Services.Candidate;
using Microsoft.AspNetCore.Mvc;

namespace AcikSecim.WebApi.Controllers
{
    [Route("api/[controller]")]
    public class CandidateController : Controller
    {
        private ICandidate _candidate;

        public CandidateController(ICandidate candidate)
        {
            _candidate = candidate;
        }

        [HttpGet("getCandidates")]
        public ActionResult<IEnumerable<Adaylar>> GetCandidateList()
        {
            return Ok(_candidate.GetCandidates());
        }
    }
}