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
    public class TPPAPRController : ApiController
    {
        private ConexionGambito db = new ConexionGambito();

        // GET: api/TPPAPR
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IQueryable<TPPAPR> GetTPPAPRs()
        {
            return db.TPPAPRs;
        }

        // GET: api/TPPAPR/5
        [ResponseType(typeof(TPPAPR))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult GetTPPAPR(string id)
        {
            TPPAPR tPPAPR = db.TPPAPRs.Find(id);
            if (tPPAPR == null)
            {
                return NotFound();
            }

            return Ok(tPPAPR);
        }

        // PUT: api/TPPAPR/5
        [ResponseType(typeof(void))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult PutTPPAPR(string id, TPPAPR tPPAPR)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != tPPAPR.Codigo)
            {
                return BadRequest();
            }

            db.Entry(tPPAPR).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TPPAPRExists(id))
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

        // POST: api/TPPAPR
        [ResponseType(typeof(TPPAPR))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult PostTPPAPR(TPPAPR tPPAPR)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.TPPAPRs.Add(tPPAPR);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (TPPAPRExists(tPPAPR.Codigo))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = tPPAPR.Codigo }, tPPAPR);
        }

        // DELETE: api/TPPAPR/5
        [ResponseType(typeof(TPPAPR))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult DeleteTPPAPR(string id)
        {
            TPPAPR tPPAPR = db.TPPAPRs.Find(id);
            if (tPPAPR == null)
            {
                return NotFound();
            }

            db.TPPAPRs.Remove(tPPAPR);
            db.SaveChanges();

            return Ok(tPPAPR);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool TPPAPRExists(string id)
        {
            return db.TPPAPRs.Count(e => e.Codigo == id) > 0;
        }
    }
}