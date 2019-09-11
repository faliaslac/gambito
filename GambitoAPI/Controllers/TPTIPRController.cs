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
    public class TPTIPRController : ApiController
    {
        private ConexionGambito db = new ConexionGambito();

        // GET: api/TPTIPR
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IQueryable<TPTIPR> GetTPTIPRs()
        {
            return db.TPTIPRs;
        }

        // GET: api/TPTIPR/5
        [ResponseType(typeof(TPTIPR))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult GetTPTIPR(string id)
        {
            TPTIPR tPTIPR = db.TPTIPRs.Find(id);
            if (tPTIPR == null)
            {
                return NotFound();
            }

            return Ok(tPTIPR);
        }

        // PUT: api/TPTIPR/5
        [ResponseType(typeof(void))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult PutTPTIPR(string id, TPTIPR tPTIPR)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != tPTIPR.Codigo)
            {
                return BadRequest();
            }

            db.Entry(tPTIPR).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TPTIPRExists(id))
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

        // POST: api/TPTIPR
        [ResponseType(typeof(TPTIPR))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult PostTPTIPR(TPTIPR tPTIPR)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.TPTIPRs.Add(tPTIPR);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (TPTIPRExists(tPTIPR.Codigo))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = tPTIPR.Codigo }, tPTIPR);
        }

        // DELETE: api/TPTIPR/5
        [ResponseType(typeof(TPTIPR))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult DeleteTPTIPR(string id)
        {
            TPTIPR tPTIPR = db.TPTIPRs.Find(id);
            if (tPTIPR == null)
            {
                return NotFound();
            }

            db.TPTIPRs.Remove(tPTIPR);
            db.SaveChanges();

            return Ok(tPTIPR);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool TPTIPRExists(string id)
        {
            return db.TPTIPRs.Count(e => e.Codigo == id) > 0;
        }
    }
}