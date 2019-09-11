using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using GambitoAPI.Models;
using System.Web.Http.Cors;


namespace GambitoAPI.Controllers
{
    public class TMVEPRController : ApiController
    {
        private ConexionGambito db = new ConexionGambito();

        // GET: api/TMVEPR
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IQueryable<TMVEPR> GetTMVEPRs()
        {
            return db.TMVEPRs;
        }

        // GET: api/TMVEPR/5
        [ResponseType(typeof(TMVEPR))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult GetTMVEPR(int id)
        {
            TMVEPR tMVEPR = db.TMVEPRs.Find(id);
            if (tMVEPR == null)
            {
                return NotFound();
            }

            return Ok(tMVEPR);
        }

        // PUT: api/TMVEPR/5
        [ResponseType(typeof(void))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult PutTMVEPR(int id, TMVEPR tMVEPR)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != tMVEPR.Id_VEPR)
            {
                return BadRequest();
            }

            db.Entry(tMVEPR).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TMVEPRExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/TMVEPR
        [ResponseType(typeof(TMVEPR))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult PostTMVEPR(TMVEPR tMVEPR)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.TMVEPRs.Add(tMVEPR);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = tMVEPR.Id_VEPR }, tMVEPR);
        }

        // DELETE: api/TMVEPR/5
        [ResponseType(typeof(TMVEPR))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult DeleteTMVEPR(int id)
        {
            TMVEPR tMVEPR = db.TMVEPRs.Find(id);
            if (tMVEPR == null)
            {
                return NotFound();
            }

            db.TMVEPRs.Remove(tMVEPR);
            db.SaveChanges();

            return Ok(tMVEPR);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool TMVEPRExists(int id)
        {
            return db.TMVEPRs.Count(e => e.Id_VEPR == id) > 0;
        }
    }
}