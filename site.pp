include mazda_production_roles
$roles_list  = unique(hiera_array('roles'))
$groups_hash = hiera_hash('groups')
$groups_list = unique(keys($groups_hash))

define apply_mazda_class ( $entity = $name, $role = undef ) {
   if $entity == $fqdn and $role != undef {
      class { "mazda_production_roles::$role": }
   }
   if $entity in $groups_list {
      $servers_in_group = $groups_hash[$entity]
      if $servers_in_group != undef {
         if $fqdn in $servers_in_group {
            class { "mazda_production_roles::$role": }
         }
      }
   }
}

define apply_roles ( $role = $name ) { 
  $entity_list = hiera_array($role, [])
  apply_mazda_class { $entity_list : role => $role }
} 

apply_roles { $roles_list :}
