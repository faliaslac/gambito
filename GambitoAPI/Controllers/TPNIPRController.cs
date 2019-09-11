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
    public class TPNIPRController : ApiController
    {
        private ConexionGambito db = new ConexionGambito();

        // GET: api/TPNIPR
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IQueryable<TPNIPR> GetTPNIPRs()
        {
            return db.TPNIPRs;
        }

        // GET: api/TPNIPR/5
        [ResponseType(typeof(TPNIPR))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult GetTPNIPR(int id)
        {
            TPNIPR tPNIPR = db.TPNIPRs.Find(id);
            if (tPNIPR == null)
            {
                return NotFound();
            }

            return Ok(tPNIPR);
        }

        // PUT: api/TPNIPR/5
        [ResponseType(typeof(void))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult PutTPNIPR(int id, TPNIPR tPNIPR)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != tPNIPR.Id_NIPR)
            {
                return BadRequest();
            }

            db.Entry(tPNIPR).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TPNIPRExists(id))
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

        // POST: api/TPNIPR
        [ResponseType(typeof(TPNIPR))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult PostTPNIPR(TPNIPR tPNIPR)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.TPNIPRs.Add(tPNIPR);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = tPNIPR.Id_NIPR }, tPNIPR);
        }

        // DELETE: api/TPNIPR/5
        [ResponseType(typeof(TPNIPR))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult DeleteTPNIPR(int id)
        {
            TPNIPR tPNIPR = db.TPNIPRs.Find(id);
            if (tPNIPR == null)
            {
                return NotFound();
            }

            db.TPNIPRs.Remove(tPNIPR);
            db.SaveChanges();

            return Ok(tPNIPR);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool TPNIPRExists(int id)
        {
            return db.TPNIPRs.Count(e => e.Id_NIPR == id) > 0;
        }
    }
}