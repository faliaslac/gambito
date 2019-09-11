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
    public class BI_BATCALCController : ApiController
    {
        private ConexionGambito db = new ConexionGambito();

        // GET: api/BI_BATCALC
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IQueryable<BI_BATCALC> GetBI_BATCALC()
        {
            return db.BI_BATCALC;
        }

        // GET: api/BI_BATCALC/5
        [ResponseType(typeof(BI_BATCALC))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult GetBI_BATCALC(int id)
        {
            BI_BATCALC bI_BATCALC = db.BI_BATCALC.Find(id);
            if (bI_BATCALC == null)
            {
                return NotFound();
            }

            return Ok(bI_BATCALC);
        }

        // PUT: api/BI_BATCALC/5
        [ResponseType(typeof(void))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult PutBI_BATCALC(int id, BI_BATCALC bI_BATCALC)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != bI_BATCALC.IdCalcBI)
            {
                return BadRequest();
            }

            db.Entry(bI_BATCALC).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BI_BATCALCExists(id))
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

        // POST: api/BI_BATCALC
        [ResponseType(typeof(BI_BATCALC))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult PostBI_BATCALC(BI_BATCALC bI_BATCALC)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.BI_BATCALC.Add(bI_BATCALC);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = bI_BATCALC.IdCalcBI }, bI_BATCALC);
        }

        // DELETE: api/BI_BATCALC/5
        [ResponseType(typeof(BI_BATCALC))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult DeleteBI_BATCALC(int id)
        {
            BI_BATCALC bI_BATCALC = db.BI_BATCALC.Find(id);
            if (bI_BATCALC == null)
            {
                return NotFound();
            }

            db.BI_BATCALC.Remove(bI_BATCALC);
            db.SaveChanges();

            return Ok(bI_BATCALC);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool BI_BATCALCExists(int id)
        {
            return db.BI_BATCALC.Count(e => e.IdCalcBI == id) > 0;
        }
    }
}