// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package emergencia.web;

import emergencia.entidad.Poblacion;
import emergencia.entidad.Sci;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.String;
import java.util.Collection;
import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.core.convert.support.GenericConversionService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect SciController_Roo_Controller {
    
    @Autowired
    private GenericConversionService SciController.conversionService;
    
    @RequestMapping(method = RequestMethod.POST)
    public String SciController.create(@Valid Sci sci, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("sci", sci);
            return "scis/create";
        }
        sci.persist();
        return "redirect:/scis/" + encodeUrlPathSegment(sci.getIdSci().toString(), request);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String SciController.createForm(Model model) {
        model.addAttribute("sci", new Sci());
        return "scis/create";
    }
    
    @RequestMapping(value = "/{idSci}", method = RequestMethod.GET)
    public String SciController.show(@PathVariable("idSci") Integer idSci, Model model) {
        model.addAttribute("sci", Sci.findSci(idSci));
        model.addAttribute("itemId", idSci);
        return "scis/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String SciController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            model.addAttribute("scis", Sci.findSciEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Sci.countScis() / sizeNo;
            model.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            model.addAttribute("scis", Sci.findAllScis());
        }
        return "scis/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String SciController.update(@Valid Sci sci, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("sci", sci);
            return "scis/update";
        }
        sci.merge();
        return "redirect:/scis/" + encodeUrlPathSegment(sci.getIdSci().toString(), request);
    }
    
    @RequestMapping(value = "/{idSci}", params = "form", method = RequestMethod.GET)
    public String SciController.updateForm(@PathVariable("idSci") Integer idSci, Model model) {
        model.addAttribute("sci", Sci.findSci(idSci));
        return "scis/update";
    }
    
    @RequestMapping(value = "/{idSci}", method = RequestMethod.DELETE)
    public String SciController.delete(@PathVariable("idSci") Integer idSci, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        Sci.findSci(idSci).remove();
        model.addAttribute("page", (page == null) ? "1" : page.toString());
        model.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/scis?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
    @ModelAttribute("poblacions")
    public Collection<Poblacion> SciController.populatePoblacions() {
        return Poblacion.findAllPoblacions();
    }
    
    Converter<Poblacion, String> SciController.getPoblacionConverter() {
        return new Converter<Poblacion, String>() {
            public String convert(Poblacion poblacion) {
                return new StringBuilder().append(poblacion.getLugar()).append(" ").append(poblacion.getDano()).append(" ").append(poblacion.getSolucion()).toString();
            }
        };
    }
    
    Converter<Sci, String> SciController.getSciConverter() {
        return new Converter<Sci, String>() {
            public String convert(Sci sci) {
                return new StringBuilder().append(sci.getComandante()).append(" ").append(sci.getSeguridad()).append(" ").append(sci.getEnlace()).toString();
            }
        };
    }
    
    @PostConstruct
    void SciController.registerConverters() {
        conversionService.addConverter(getPoblacionConverter());
        conversionService.addConverter(getSciConverter());
    }
    
    @RequestMapping(value = "/{idSci}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public String SciController.showJson(@PathVariable("idSci") Integer idSci) {
        return Sci.findSci(idSci).toJson();
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> SciController.createFromJson(@RequestBody String json) {
        Sci.fromJsonToSci(json).persist();
        return new ResponseEntity<String>("Sci created", HttpStatus.CREATED);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public String SciController.listJson() {
        return Sci.toJsonArray(Sci.findAllScis());
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> SciController.createFromJsonArray(@RequestBody String json) {
        for (Sci sci: Sci.fromJsonArrayToScis(json)) {
            sci.persist();
        }
        return new ResponseEntity<String>("Sci created", HttpStatus.CREATED);
    }
    
    private String SciController.encodeUrlPathSegment(String pathSegment, HttpServletRequest request) {
        String enc = request.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}