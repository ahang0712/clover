; ModuleID = 'svp_simple_006_001.bc'
source_filename = "./svp_simple_006_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@flag = global i8 85, align 1
@svp_simple_006_001_global_var1 = common global i32 0, align 4
@svp_simple_006_001_global_var2 = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_006_001_main() #0 !dbg !7 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  call void (...) @init(), !dbg !10
  %8 = bitcast i32* %1 to i8*, !dbg !11
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %8) #3, !dbg !11
  %9 = bitcast i32* %2 to i8*, !dbg !11
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %9) #3, !dbg !11
  %10 = bitcast i32* %3 to i8*, !dbg !12
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %10) #3, !dbg !12
  store i32 0, i32* %3, align 4, !dbg !13, !tbaa !14
  br label %11, !dbg !12

11:                                               ; preds = %50, %0
  %12 = load i32, i32* %3, align 4, !dbg !18, !tbaa !14
  %13 = icmp slt i32 %12, 5, !dbg !19
  br i1 %13, label %16, label %14, !dbg !20

14:                                               ; preds = %11
  store i32 2, i32* %4, align 4
  %15 = bitcast i32* %3 to i8*, !dbg !20
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %15) #3, !dbg !20
  br label %53

16:                                               ; preds = %11
  %17 = bitcast i32* %5 to i8*, !dbg !21
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %17) #3, !dbg !21
  store i32 0, i32* %5, align 4, !dbg !22, !tbaa !14
  br label %18, !dbg !21

18:                                               ; preds = %46, %16
  %19 = load i32, i32* %5, align 4, !dbg !23, !tbaa !14
  %20 = icmp slt i32 %19, 5, !dbg !24
  br i1 %20, label %23, label %21, !dbg !25

21:                                               ; preds = %18
  store i32 5, i32* %4, align 4
  %22 = bitcast i32* %5 to i8*, !dbg !25
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %22) #3, !dbg !25
  br label %49

23:                                               ; preds = %18
  %24 = load i32, i32* %3, align 4, !dbg !26, !tbaa !14
  %25 = load i32, i32* %5, align 4, !dbg !27, !tbaa !14
  %26 = icmp eq i32 %24, %25, !dbg !28
  br i1 %26, label %27, label %45, !dbg !26

27:                                               ; preds = %23
  %28 = load i32, i32* %3, align 4, !dbg !29, !tbaa !14
  %29 = icmp eq i32 %28, 0, !dbg !30
  br i1 %29, label %30, label %32, !dbg !29

30:                                               ; preds = %27
  %31 = load volatile i32, i32* @svp_simple_006_001_global_var1, align 4, !dbg !31, !tbaa !14
  store i32 %31, i32* %1, align 4, !dbg !32, !tbaa !14
  br label %44, !dbg !33

32:                                               ; preds = %27
  %33 = load i32, i32* %3, align 4, !dbg !34, !tbaa !14
  %34 = icmp eq i32 %33, 4, !dbg !35
  br i1 %34, label %35, label %37, !dbg !34

35:                                               ; preds = %32
  %36 = load volatile i32, i32* @svp_simple_006_001_global_var1, align 4, !dbg !36, !tbaa !14
  store i32 %36, i32* %2, align 4, !dbg !37, !tbaa !14
  br label %43, !dbg !38

37:                                               ; preds = %32
  %38 = load i32, i32* %3, align 4, !dbg !39, !tbaa !14
  %39 = icmp eq i32 %38, 6, !dbg !40
  br i1 %39, label %40, label %42, !dbg !39

40:                                               ; preds = %37
  %41 = load volatile i32, i32* @svp_simple_006_001_global_var1, align 4, !dbg !41, !tbaa !14
  store i32 %41, i32* %2, align 4, !dbg !42, !tbaa !14
  br label %42, !dbg !43

42:                                               ; preds = %40, %37
  br label %43

43:                                               ; preds = %42, %35
  br label %44

44:                                               ; preds = %43, %30
  br label %45, !dbg !44

45:                                               ; preds = %44, %23
  br label %46, !dbg !45

46:                                               ; preds = %45
  %47 = load i32, i32* %5, align 4, !dbg !46, !tbaa !14
  %48 = add nsw i32 %47, 1, !dbg !46
  store i32 %48, i32* %5, align 4, !dbg !46, !tbaa !14
  br label %18, !dbg !25, !llvm.loop !47

49:                                               ; preds = %21
  br label %50, !dbg !48

50:                                               ; preds = %49
  %51 = load i32, i32* %3, align 4, !dbg !49, !tbaa !14
  %52 = add nsw i32 %51, 1, !dbg !49
  store i32 %52, i32* %3, align 4, !dbg !49, !tbaa !14
  br label %11, !dbg !20, !llvm.loop !50

53:                                               ; preds = %14
  %54 = bitcast i32* %6 to i8*, !dbg !51
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %54) #3, !dbg !51
  store i32 0, i32* %6, align 4, !dbg !52, !tbaa !14
  br label %55, !dbg !51

55:                                               ; preds = %82, %53
  %56 = load i32, i32* %6, align 4, !dbg !53, !tbaa !14
  %57 = icmp slt i32 %56, 5, !dbg !54
  br i1 %57, label %60, label %58, !dbg !55

58:                                               ; preds = %55
  store i32 8, i32* %4, align 4
  %59 = bitcast i32* %6 to i8*, !dbg !55
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %59) #3, !dbg !55
  br label %85

60:                                               ; preds = %55
  %61 = bitcast i32* %7 to i8*, !dbg !56
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %61) #3, !dbg !56
  store i32 0, i32* %7, align 4, !dbg !57, !tbaa !14
  br label %62, !dbg !56

62:                                               ; preds = %78, %60
  %63 = load i32, i32* %7, align 4, !dbg !58, !tbaa !14
  %64 = icmp slt i32 %63, 5, !dbg !59
  br i1 %64, label %67, label %65, !dbg !60

65:                                               ; preds = %62
  store i32 11, i32* %4, align 4
  %66 = bitcast i32* %7 to i8*, !dbg !60
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %66) #3, !dbg !60
  br label %81

67:                                               ; preds = %62
  %68 = load i32, i32* %6, align 4, !dbg !61, !tbaa !14
  %69 = load i32, i32* %7, align 4, !dbg !62, !tbaa !14
  %70 = add nsw i32 %68, %69, !dbg !63
  %71 = icmp eq i32 %70, 6, !dbg !64
  br i1 %71, label %72, label %77, !dbg !65

72:                                               ; preds = %67
  %73 = load i32, i32* %6, align 4, !dbg !66, !tbaa !14
  %74 = load i32, i32* %7, align 4, !dbg !67, !tbaa !14
  %75 = icmp slt i32 %73, %74, !dbg !68
  br i1 %75, label %76, label %77, !dbg !69

76:                                               ; preds = %72
  store volatile i32 2, i32* @svp_simple_006_001_global_var2, align 4, !dbg !70, !tbaa !14
  br label %77, !dbg !71

77:                                               ; preds = %76, %72, %67
  br label %78, !dbg !72

78:                                               ; preds = %77
  %79 = load i32, i32* %7, align 4, !dbg !73, !tbaa !14
  %80 = add nsw i32 %79, 1, !dbg !73
  store i32 %80, i32* %7, align 4, !dbg !73, !tbaa !14
  br label %62, !dbg !60, !llvm.loop !74

81:                                               ; preds = %65
  br label %82, !dbg !75

82:                                               ; preds = %81
  %83 = load i32, i32* %6, align 4, !dbg !76, !tbaa !14
  %84 = add nsw i32 %83, 1, !dbg !76
  store i32 %84, i32* %6, align 4, !dbg !76, !tbaa !14
  br label %55, !dbg !55, !llvm.loop !77

85:                                               ; preds = %58
  %86 = bitcast i32* %2 to i8*, !dbg !78
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %86) #3, !dbg !78
  %87 = bitcast i32* %1 to i8*, !dbg !78
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %87) #3, !dbg !78
  ret void, !dbg !78
}

declare void @init(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_006_001_isr_1() #0 !dbg !79 {
  %1 = alloca i32, align 4
  %2 = bitcast i32* %1 to i8*, !dbg !80
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3, !dbg !80
  call void (...) @idlerun(), !dbg !81
  store volatile i32 0, i32* @svp_simple_006_001_global_var1, align 4, !dbg !82, !tbaa !14
  %3 = load volatile i32, i32* @svp_simple_006_001_global_var2, align 4, !dbg !83, !tbaa !14
  store i32 %3, i32* %1, align 4, !dbg !84, !tbaa !14
  %4 = bitcast i32* %1 to i8*, !dbg !85
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %4) #3, !dbg !85
  ret void, !dbg !85
}

declare void @idlerun(...) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_006_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_006")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_006_001_main", scope: !8, file: !8, line: 10, type: !9, scopeLine: 11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_006_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_006")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 12, column: 3, scope: !7)
!11 = !DILocation(line: 13, column: 3, scope: !7)
!12 = !DILocation(line: 15, column: 8, scope: !7)
!13 = !DILocation(line: 15, column: 12, scope: !7)
!14 = !{!15, !15, i64 0}
!15 = !{!"int", !16, i64 0}
!16 = !{!"omnipotent char", !17, i64 0}
!17 = !{!"Simple C/C++ TBAA"}
!18 = !DILocation(line: 15, column: 19, scope: !7)
!19 = !DILocation(line: 15, column: 21, scope: !7)
!20 = !DILocation(line: 15, column: 3, scope: !7)
!21 = !DILocation(line: 17, column: 10, scope: !7)
!22 = !DILocation(line: 17, column: 14, scope: !7)
!23 = !DILocation(line: 17, column: 21, scope: !7)
!24 = !DILocation(line: 17, column: 23, scope: !7)
!25 = !DILocation(line: 17, column: 5, scope: !7)
!26 = !DILocation(line: 19, column: 11, scope: !7)
!27 = !DILocation(line: 19, column: 16, scope: !7)
!28 = !DILocation(line: 19, column: 13, scope: !7)
!29 = !DILocation(line: 21, column: 13, scope: !7)
!30 = !DILocation(line: 21, column: 15, scope: !7)
!31 = !DILocation(line: 22, column: 21, scope: !7)
!32 = !DILocation(line: 22, column: 19, scope: !7)
!33 = !DILocation(line: 22, column: 11, scope: !7)
!34 = !DILocation(line: 23, column: 18, scope: !7)
!35 = !DILocation(line: 23, column: 20, scope: !7)
!36 = !DILocation(line: 24, column: 21, scope: !7)
!37 = !DILocation(line: 24, column: 19, scope: !7)
!38 = !DILocation(line: 24, column: 11, scope: !7)
!39 = !DILocation(line: 25, column: 18, scope: !7)
!40 = !DILocation(line: 25, column: 20, scope: !7)
!41 = !DILocation(line: 26, column: 21, scope: !7)
!42 = !DILocation(line: 26, column: 19, scope: !7)
!43 = !DILocation(line: 26, column: 11, scope: !7)
!44 = !DILocation(line: 27, column: 7, scope: !7)
!45 = !DILocation(line: 28, column: 5, scope: !7)
!46 = !DILocation(line: 17, column: 29, scope: !7)
!47 = distinct !{!47, !25, !45}
!48 = !DILocation(line: 29, column: 3, scope: !7)
!49 = !DILocation(line: 15, column: 27, scope: !7)
!50 = distinct !{!50, !20, !48}
!51 = !DILocation(line: 31, column: 8, scope: !7)
!52 = !DILocation(line: 31, column: 12, scope: !7)
!53 = !DILocation(line: 31, column: 19, scope: !7)
!54 = !DILocation(line: 31, column: 21, scope: !7)
!55 = !DILocation(line: 31, column: 3, scope: !7)
!56 = !DILocation(line: 33, column: 10, scope: !7)
!57 = !DILocation(line: 33, column: 14, scope: !7)
!58 = !DILocation(line: 33, column: 21, scope: !7)
!59 = !DILocation(line: 33, column: 23, scope: !7)
!60 = !DILocation(line: 33, column: 5, scope: !7)
!61 = !DILocation(line: 35, column: 13, scope: !7)
!62 = !DILocation(line: 35, column: 17, scope: !7)
!63 = !DILocation(line: 35, column: 15, scope: !7)
!64 = !DILocation(line: 35, column: 20, scope: !7)
!65 = !DILocation(line: 35, column: 26, scope: !7)
!66 = !DILocation(line: 35, column: 30, scope: !7)
!67 = !DILocation(line: 35, column: 34, scope: !7)
!68 = !DILocation(line: 35, column: 32, scope: !7)
!69 = !DILocation(line: 35, column: 11, scope: !7)
!70 = !DILocation(line: 36, column: 40, scope: !7)
!71 = !DILocation(line: 36, column: 9, scope: !7)
!72 = !DILocation(line: 37, column: 5, scope: !7)
!73 = !DILocation(line: 33, column: 29, scope: !7)
!74 = distinct !{!74, !60, !72}
!75 = !DILocation(line: 38, column: 3, scope: !7)
!76 = !DILocation(line: 31, column: 27, scope: !7)
!77 = distinct !{!77, !55, !75}
!78 = !DILocation(line: 39, column: 1, scope: !7)
!79 = distinct !DISubprogram(name: "svp_simple_006_001_isr_1", scope: !8, file: !8, line: 41, type: !9, scopeLine: 42, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!80 = !DILocation(line: 43, column: 3, scope: !79)
!81 = !DILocation(line: 44, column: 3, scope: !79)
!82 = !DILocation(line: 46, column: 34, scope: !79)
!83 = !DILocation(line: 47, column: 13, scope: !79)
!84 = !DILocation(line: 47, column: 11, scope: !79)
!85 = !DILocation(line: 48, column: 1, scope: !79)
