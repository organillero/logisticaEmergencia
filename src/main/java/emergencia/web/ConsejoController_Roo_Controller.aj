// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package emergencia.web;

import emergencia.entidad.Consejo;
import emergencia.entidad.Emergencia;
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

privileged aspect ConsejoController_Roo_Controller {
    
    @Autowired
    private GenericConversionService ConsejoController.conversionService;
    
    @RequestMapping(method = RequestMethod.POST)
    public String ConsejoController.create(@Valid Consejo consejo, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("consejo", consejo);
            return "consejoes/create";
        }
        consejo.persist();
        return "redirect:/consejoes/" + encodeUrlPathSegment(consejo.getIdConsejo().toString(), request);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String ConsejoController.createForm(Model model) {
        model.addAttribute("consejo", new Consejo());
        return "consejoes/create";
    }
    
    @RequestMapping(value = "/{idConsejo}", method = RequestMethod.GET)
    public String ConsejoController.show(@PathVariable("idConsejo") Integer idConsejo, Model model) {
        model.addAttribute("consejo", Consejo.findConsejo(idConsejo));
        model.addAttribute("itemId", idConsejo);
        return "consejoes/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String ConsejoController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            model.addAttribute("consejoes", Consejo.findConsejoEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Consejo.countConsejoes() / sizeNo;
            model.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            model.addAttribute("consejoes", Consejo.findAllConsejoes());
        }
        return "consejoes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String ConsejoController.update(@Valid Consejo consejo, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("consejo", consejo);
            return "consejoes/update";
        }
        consejo.merge();
        return "redirect:/consejoes/" + encodeUrlPathSegment(consejo.getIdConsejo().toString(), request);
    }
    
    @RequestMapping(value = "/{idConsejo}", params = "form", method = RequestMethod.GET)
    public String ConsejoController.updateForm(@PathVariable("idConsejo") Integer idConsejo, Model model) {
        model.addAttribute("consejo", Consejo.findConsejo(idConsejo));
        return "consejoes/update";
    }
    
    @RequestMapping(value = "/{idConsejo}", method = RequestMethod.DELETE)
    public String ConsejoController.delete(@PathVariable("idConsejo") Integer idConsejo, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        Consejo.findConsejo(idConsejo).remove();
        model.addAttribute("page", (page == null) ? "1" : page.toString());
        model.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/consejoes?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
    @ModelAttribute("emergencias")
    public Collection<Emergencia> ConsejoController.populateEmergencias() {
        return Emergencia.findAllEmergencias();
    }
    
    Converter<Consejo, String> ConsejoController.getConsejoConverter() {
        return new Converter<Consejo, String>() {
            public String convert(Consejo consejo) {
                return new StringBuilder().append(consejo.getNombre()).append(" ").append(consejo.getIdResponsable()).toString();
            }
        };
    }
    
    Converter<Emergencia, String> ConsejoController.getEmergenciaConverter() {
        return new Converter<Emergencia, String>() {
            public String convert(Emergencia emergencia) {
                return new StringBuilder().append(emergencia.getUbicacion()).append(" ").append(emergencia.getNombre()).append(" ").append(emergencia.getFechaInicio()).toString();
            }
        };
    }
    
    @PostConstruct
    void ConsejoController.registerConverters() {
        conversionService.addConverter(getConsejoConverter());
        conversionService.addConverter(getEmergenciaConverter());
    }
    
    @RequestMapping(value = "/{idConsejo}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public String ConsejoController.showJson(@PathVariable("idConsejo") Integer idConsejo) {
        return Consejo.findConsejo(idConsejo).toJson();
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> ConsejoController.createFromJson(@RequestBody String json) {
        Consejo.fromJsonToConsejo(json).persist();
        return new ResponseEntity<String>("Consejo created", HttpStatus.CREATED);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public String ConsejoController.listJson() {
        return Consejo.toJsonArray(Consejo.findAllConsejoes());
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> ConsejoController.createFromJsonArray(@RequestBody String json) {
        for (Consejo consejo: Consejo.fromJsonArrayToConsejoes(json)) {
            consejo.persist();
        }
        return new ResponseEntity<String>("Consejo created", HttpStatus.CREATED);
    }
    
    private String ConsejoController.encodeUrlPathSegment(String pathSegment, HttpServletRequest request) {
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
