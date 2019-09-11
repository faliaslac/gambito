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
    public class TDMOPRController : ApiController
    {
        private ConexionGambito db = new ConexionGambito();

        // GET: api/TDMOPR
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IQueryable<TDMOPR> GetTDMOPRs()
        {
            return db.TDMOPRs;
        }

        // GET: api/TDMOPR/5
        [ResponseType(typeof(TDMOPR))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult GetTDMOPR(int id)
        {
            TDMOPR tDMOPR = db.TDMOPRs.Find(id);
            if (tDMOPR == null)
            {
                return NotFound();
            }

            return Ok(tDMOPR);
        }

        // PUT: api/TDMOPR/5
        [ResponseType(typeof(void))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult PutTDMOPR(int id, TDMOPR tDMOPR)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != tDMOPR.Id_MOPR)
            {
                return BadRequest();
            }

            db.Entry(tDMOPR).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TDMOPRExists(id))
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

        // POST: api/TDMOPR
        [ResponseType(typeof(TDMOPR))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult PostTDMOPR(TDMOPR tDMOPR)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.TDMOPRs.Add(tDMOPR);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = tDMOPR.Id_MOPR }, tDMOPR);
        }

        // DELETE: api/TDMOPR/5
        [ResponseType(typeof(TDMOPR))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult DeleteTDMOPR(int id)
        {
            TDMOPR tDMOPR = db.TDMOPRs.Find(id);
            if (tDMOPR == null)
            {
                return NotFound();
            }

            db.TDMOPRs.Remove(tDMOPR);
            db.SaveChanges();

            return Ok(tDMOPR);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool TDMOPRExists(int id)
        {
            return db.TDMOPRs.Count(e => e.Id_MOPR == id) > 0;
        }
    }
}