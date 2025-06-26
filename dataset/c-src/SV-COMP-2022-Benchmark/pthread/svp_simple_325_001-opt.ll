; ModuleID = 'svp_simple_325_001-opt.bc'
source_filename = "./svp_simple_325_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@data1 = common global i32 0, align 4
@data2 = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @reach_error() #0 !dbg !7 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !10
  ret void, !dbg !11
}

declare i32 @assert(...) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_325_001_isr_1(i8* %0) #0 !dbg !12 {
  %2 = load i32, i32* @data1, align 4, !dbg !13, !tbaa !14
  %3 = add nsw i32 %2, 1, !dbg !18
  store i32 %3, i32* @data1, align 4, !dbg !19, !tbaa !14
  %4 = load i32, i32* @data2, align 4, !dbg !20, !tbaa !14
  %5 = add nsw i32 %4, 1, !dbg !21
  store i32 %5, i32* @data2, align 4, !dbg !22, !tbaa !14
  ret void, !dbg !23
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_325_001_isr_2(i8* %0) #0 !dbg !24 {
  %2 = load i32, i32* @data1, align 4, !dbg !25, !tbaa !14
  %3 = add nsw i32 %2, 5, !dbg !26
  store i32 %3, i32* @data1, align 4, !dbg !27, !tbaa !14
  %4 = load i32, i32* @data2, align 4, !dbg !28, !tbaa !14
  %5 = sub nsw i32 %4, 6, !dbg !29
  store i32 %5, i32* @data2, align 4, !dbg !30, !tbaa !14
  ret void, !dbg !31
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_325_001_main() #0 !dbg !32 {
  store i32 10, i32* @data1, align 4, !dbg !33, !tbaa !14
  store i32 10, i32* @data2, align 4, !dbg !34, !tbaa !14
  %1 = load i32, i32* @data1, align 4, !dbg !35, !tbaa !14
  %2 = icmp ne i32 %1, 16, !dbg !36
  br i1 %2, label %3, label %9, !dbg !37

3:                                                ; preds = %0
  %4 = load i32, i32* @data2, align 4, !dbg !38, !tbaa !14
  %5 = icmp ne i32 %4, 5, !dbg !39
  br i1 %5, label %6, label %9, !dbg !35

6:                                                ; preds = %3
  br label %7, !dbg !40

7:                                                ; preds = %6
  %8 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !41
  call void @abort() #5, !dbg !43
  unreachable, !dbg !43

9:                                                ; preds = %3, %0
  ret i32 0, !dbg !44
}

; Function Attrs: noreturn
declare void @abort() #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_325_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/pthread")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 4, type: !9, scopeLine: 4, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_325_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/pthread")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 4, column: 22, scope: !7)
!11 = !DILocation(line: 4, column: 33, scope: !7)
!12 = distinct !DISubprogram(name: "svp_simple_325_001_isr_1", scope: !8, file: !8, line: 8, type: !9, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!13 = !DILocation(line: 10, column: 13, scope: !12)
!14 = !{!15, !15, i64 0}
!15 = !{!"int", !16, i64 0}
!16 = !{!"omnipotent char", !17, i64 0}
!17 = !{!"Simple C/C++ TBAA"}
!18 = !DILocation(line: 10, column: 18, scope: !12)
!19 = !DILocation(line: 11, column: 8, scope: !12)
!20 = !DILocation(line: 12, column: 14, scope: !12)
!21 = !DILocation(line: 12, column: 19, scope: !12)
!22 = !DILocation(line: 13, column: 8, scope: !12)
!23 = !DILocation(line: 15, column: 1, scope: !12)
!24 = distinct !DISubprogram(name: "svp_simple_325_001_isr_2", scope: !8, file: !8, line: 18, type: !9, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!25 = !DILocation(line: 20, column: 14, scope: !24)
!26 = !DILocation(line: 20, column: 19, scope: !24)
!27 = !DILocation(line: 21, column: 8, scope: !24)
!28 = !DILocation(line: 22, column: 14, scope: !24)
!29 = !DILocation(line: 22, column: 19, scope: !24)
!30 = !DILocation(line: 23, column: 8, scope: !24)
!31 = !DILocation(line: 24, column: 1, scope: !24)
!32 = distinct !DISubprogram(name: "svp_simple_325_001_main", scope: !8, file: !8, line: 27, type: !9, scopeLine: 28, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!33 = !DILocation(line: 30, column: 9, scope: !32)
!34 = !DILocation(line: 31, column: 9, scope: !32)
!35 = !DILocation(line: 35, column: 7, scope: !32)
!36 = !DILocation(line: 35, column: 12, scope: !32)
!37 = !DILocation(line: 35, column: 17, scope: !32)
!38 = !DILocation(line: 35, column: 20, scope: !32)
!39 = !DILocation(line: 35, column: 25, scope: !32)
!40 = !DILocation(line: 36, column: 3, scope: !32)
!41 = !DILocation(line: 4, column: 22, scope: !7, inlinedAt: !42)
!42 = distinct !DILocation(line: 37, column: 13, scope: !32)
!43 = !DILocation(line: 37, column: 27, scope: !32)
!44 = !DILocation(line: 40, column: 3, scope: !32)
