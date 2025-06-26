; ModuleID = 'svp_simple_506_001-opt.bc'
source_filename = "./svp_simple_506_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@glob = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @f() #0 !dbg !7 {
  %1 = load i32, i32* @glob, align 4, !dbg !10, !tbaa !11
  %2 = add nsw i32 %1, 1, !dbg !15
  %3 = load i32, i32* @glob, align 4, !dbg !16, !tbaa !11
  %4 = add nsw i32 %3, 1, !dbg !17
  store i32 %4, i32* @glob, align 4, !dbg !18, !tbaa !11
  call void @exit(i32 0) #3, !dbg !19
  unreachable, !dbg !19

5:                                                ; No predecessors!
  ret void, !dbg !20
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: noreturn
declare void @exit(i32) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_506_001_isr_1(i8* %0) #0 !dbg !21 {
  %2 = load i32, i32* @glob, align 4, !dbg !22, !tbaa !11
  %3 = add nsw i32 %2, 1, !dbg !23
  %4 = load i32, i32* @glob, align 4, !dbg !24, !tbaa !11
  %5 = add nsw i32 %4, 1, !dbg !25
  store i32 %5, i32* @glob, align 4, !dbg !26, !tbaa !11
  ret void, !dbg !27
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define i32 @svp_simple_506_001_main() #0 !dbg !28 {
  %1 = load i32, i32* @glob, align 4, !dbg !29, !tbaa !11
  %2 = add nsw i32 %1, 1, !dbg !31
  %3 = load i32, i32* @glob, align 4, !dbg !32, !tbaa !11
  %4 = add nsw i32 %3, 1, !dbg !33
  store i32 %4, i32* @glob, align 4, !dbg !34, !tbaa !11
  call void @exit(i32 0) #4, !dbg !35
  unreachable, !dbg !35

f.exit:                                           ; No predecessors!
  store i32 8, i32* @glob, align 4, !dbg !36, !tbaa !11
  ret i32 0, !dbg !37
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }
attributes #4 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_506_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "f", scope: !8, file: !8, line: 8, type: !9, scopeLine: 8, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_506_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 9, column: 13, scope: !7)
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C/C++ TBAA"}
!15 = !DILocation(line: 9, column: 17, scope: !7)
!16 = !DILocation(line: 10, column: 10, scope: !7)
!17 = !DILocation(line: 10, column: 14, scope: !7)
!18 = !DILocation(line: 10, column: 8, scope: !7)
!19 = !DILocation(line: 13, column: 3, scope: !7)
!20 = !DILocation(line: 14, column: 1, scope: !7)
!21 = distinct !DISubprogram(name: "svp_simple_506_001_isr_1", scope: !8, file: !8, line: 16, type: !9, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!22 = !DILocation(line: 17, column: 13, scope: !21)
!23 = !DILocation(line: 17, column: 17, scope: !21)
!24 = !DILocation(line: 18, column: 8, scope: !21)
!25 = !DILocation(line: 18, column: 12, scope: !21)
!26 = !DILocation(line: 18, column: 7, scope: !21)
!27 = !DILocation(line: 21, column: 1, scope: !21)
!28 = distinct !DISubprogram(name: "svp_simple_506_001_main", scope: !8, file: !8, line: 23, type: !9, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!29 = !DILocation(line: 9, column: 13, scope: !7, inlinedAt: !30)
!30 = distinct !DILocation(line: 28, column: 3, scope: !28)
!31 = !DILocation(line: 9, column: 17, scope: !7, inlinedAt: !30)
!32 = !DILocation(line: 10, column: 10, scope: !7, inlinedAt: !30)
!33 = !DILocation(line: 10, column: 14, scope: !7, inlinedAt: !30)
!34 = !DILocation(line: 10, column: 8, scope: !7, inlinedAt: !30)
!35 = !DILocation(line: 13, column: 3, scope: !7, inlinedAt: !30)
!36 = !DILocation(line: 30, column: 8, scope: !28)
!37 = !DILocation(line: 31, column: 3, scope: !28)
