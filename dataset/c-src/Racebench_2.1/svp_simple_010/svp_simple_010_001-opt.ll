; ModuleID = 'svp_simple_010_001-opt.bc'
source_filename = "./svp_simple_010_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.pack1 = type { i32 }
%struct.pack2 = type { i8, i32 }

@svp_simple_010_001_global_union = common global %union.pack1 zeroinitializer, align 4
@svp_simple_010_001_global_struct = common global %struct.pack2 zeroinitializer, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_010_001_main() #0 !dbg !7 {
  call void (...) @init(), !dbg !10
  store volatile i8 1, i8* bitcast (%union.pack1* @svp_simple_010_001_global_union to i8*), align 4, !dbg !11, !tbaa !12
  store volatile i32 2, i32* getelementptr inbounds (%union.pack1, %union.pack1* @svp_simple_010_001_global_union, i32 0, i32 0), align 4, !dbg !15, !tbaa !12
  store volatile i8 3, i8* getelementptr inbounds (%struct.pack2, %struct.pack2* @svp_simple_010_001_global_struct, i32 0, i32 0), align 4, !dbg !16, !tbaa !17
  store volatile i32 4, i32* getelementptr inbounds (%struct.pack2, %struct.pack2* @svp_simple_010_001_global_struct, i32 0, i32 1), align 4, !dbg !20, !tbaa !21
  ret void, !dbg !22
}

declare void @init(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_010_001_isr_1() #0 !dbg !23 {
  call void (...) @idlerun(), !dbg !24
  %1 = load volatile i8, i8* bitcast (%union.pack1* @svp_simple_010_001_global_union to i8*), align 4, !dbg !25, !tbaa !12
  %2 = zext i8 %1 to i32, !dbg !26
  %3 = load volatile i8, i8* getelementptr inbounds (%struct.pack2, %struct.pack2* @svp_simple_010_001_global_struct, i32 0, i32 0), align 4, !dbg !27, !tbaa !17
  %4 = zext i8 %3 to i32, !dbg !28
  ret void, !dbg !29
}

declare void @idlerun(...) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_010_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_010")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_010_001_main", scope: !8, file: !8, line: 17, type: !9, scopeLine: 17, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_010_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_010")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 18, column: 3, scope: !7)
!11 = !DILocation(line: 25, column: 42, scope: !7)
!12 = !{!13, !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C/C++ TBAA"}
!15 = !DILocation(line: 26, column: 40, scope: !7)
!16 = !DILocation(line: 28, column: 43, scope: !7)
!17 = !{!18, !13, i64 0}
!18 = !{!"pack2", !13, i64 0, !19, i64 4}
!19 = !{!"int", !13, i64 0}
!20 = !DILocation(line: 29, column: 41, scope: !7)
!21 = !{!18, !19, i64 4}
!22 = !DILocation(line: 30, column: 1, scope: !7)
!23 = distinct !DISubprogram(name: "svp_simple_010_001_isr_1", scope: !8, file: !8, line: 32, type: !9, scopeLine: 32, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!24 = !DILocation(line: 33, column: 3, scope: !23)
!25 = !DILocation(line: 36, column: 45, scope: !23)
!26 = !DILocation(line: 36, column: 13, scope: !23)
!27 = !DILocation(line: 38, column: 46, scope: !23)
!28 = !DILocation(line: 38, column: 13, scope: !23)
!29 = !DILocation(line: 39, column: 1, scope: !23)
